import assert from 'assert';
import fs from 'fs';
import path from 'path';
import JSZip from 'jszip';
import { glob } from 'glob';

const configText = fs.readFileSync("generateICCMapConfig.jsonc", 'utf8').replace(/\/\/(.*)/g, '')
const config = JSON.parse(configText);

assert(Array.isArray(config.globsToReplace), "generateICCMapConfig.jsonc is missing globsToReplace or is invalid")

const files = await glob(config.globsToReplace, { cwd: path.resolve(process.cwd(), '../'), ignore: '**/.DS_Store'});

console.log("The following files will be copied into the .map:", files)

const zipData = fs.readFileSync("default.map");

const zip = await JSZip.loadAsync(zipData);

for (const file of files) {
    console.log("Copying file: ", file)
    const fileContents = fs.readFileSync(`../${file}`);
    zip.file(file, fileContents);
}

zip.generateNodeStream({type:'nodebuffer', streamFiles:true})
.pipe(fs.createWriteStream('output.map'))
.on('finish', function () {
    console.log("All done!");
});
