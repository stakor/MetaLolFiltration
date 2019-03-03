# MetaLolFiltration

### Blog Post:
<Coming Soon>

### Creator:
Chris Stakor

### What is MetaLolFiltration?

MetaLolFiltration is a tool that will allow the user to evade base64 detection. Say, in the use of a DLP solution. Given that the resulting text will appear rather odd, it might take a little bit for it to be recognized for what it is, obfuscated (barely) base64. MetaLolFiltration is a more robust version of the LolFiltration script.

### How Does it work?
Payload -> Base64

Base64 -> MetaLolFiltration

MetaLolFiltration - > base64

As you were…


### Usage:

Use Wrapper Script to encode the file:

`MetaLolfiltration.sh <binary>`

Use Wrapper script to decode the file:

`MetaLolfiltration.sh -d <name>.lol`

*or*

For just the conversion process:

`core_lol.py <input.64> <output.lol>`

To extract:

`core_lol.py -d <input.lol> <output.file>`

### Example:
<Coming Soon>

### Q&A:

*Q:* Why?

*A:* Why Not?

*Q:* What useful purpose does this serve?

*A:* Base64 obfuscation / DLP evasion.

*Q:* In the least reasonable way possible?

*A:* LOL
