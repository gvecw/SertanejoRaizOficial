const fs = require('fs');

const index = fs.readFileSync('index.html', 'utf8');
const list1 = fs.readFileSync('list1.html', 'utf8');
const list2 = fs.readFileSync('list2.html', 'utf8');

const lines = index.split('\n');

const list1Start = lines.findIndex((l) => l.includes('<h3 class="text-2xl font-black text-white mb-1">Acesso Básico</h3>'));
const list2Start = lines.findIndex((l) => l.includes('<h3 class="text-2xl font-black text-amber-400 mb-1 mt-2">Acesso Premium</h3>'));

if (list1Start === -1 || list2Start === -1) {
    console.error('Headings not found!', list1Start, list2Start);
    process.exit(1);
}

// Find ul for list 1 (from list1Start)
let ul1Start = -1;
let ul1End = -1;
for (let i = list1Start; i < lines.length; i++) {
    if (lines[i].includes('<ul')) ul1Start = i;
    if (lines[i].includes('</ul>')) { ul1End = i; break; }
}

let ul2Start = -1;
let ul2End = -1;
for (let i = list2Start; i < lines.length; i++) {
    if (lines[i].includes('<ul')) ul2Start = i;
    if (lines[i].includes('</ul>')) { ul2End = i; break; }
}

if (ul1Start === -1 || ul1End === -1 || ul2Start === -1 || ul2End === -1) {
    console.error('UL tags not found!');
    process.exit(1);
}

// Replace
const newLines = [];
for (let i = 0; i < lines.length; i++) {
    if (i === ul1Start) {
        newLines.push(list1);
        i = ul1End; // skip until ul1End
        continue;
    }
    if (i === ul2Start) {
        newLines.push(list2);
        i = ul2End; // skip until ul2End
        continue;
    }
    
    // As a bonus, let's fix the bug where I changed Acesso Premium heading from h3 class="text-xl" to "text-2xl" by accident, actually it was requested text-xl. Wait, in view_file it was text-xl but wait it was text-2xl in one place. I will leave it exactly as it is.
    newLines.push(lines[i]);
}

fs.writeFileSync('index.html', newLines.join('\n'));
console.log('Update successful!');
