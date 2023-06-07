---
title: converts
date: 2023-06-06 15:24
author: Leo Song
categories:
  - Markdown
tags:
---

标签

- #转换
- #markdown 
- #OPML

## opml-to-markdown

Convert OPML(Outline) to Markdown

Use Case

- [OmniOutliner](http://www.omnigroup.com/omnioutliner "OmniOutliner")'s opml -> Markdown -> [cleaver](https://github.com/jdan/cleaver "cleaver")'s slide.

### Installation

```shell
npm install opml-to-markdown -g
```

### Usage

```shell
$ opml-to-markdown -h
Usage: cmd [options]

  -h, --help            displays help
  -e, --entry String    opml file path
  -o, --outfile String  output to file path
  --require String      builder module(like build-slide-markdown.js) path
```

```shell
$ opml-to-markdown test/fixtures/header-list-note/test.opml
```

```xml
<?xml version="1.0" encoding="utf-8"?>
<opml version="1.0">
  <head>
    <title>title</title>
    <expansionState>0,2</expansionState>
  </head>
  <body>
    <outline text="H1">
      <outline text="H2 Text"/>
      <outline text="H2">
        <outline text="text"/>
      </outline>
    </outline>
    <outline text="H1 text" _note="note\nnote"/>
  </body>
</opml>
```

to

```gfm
title: title
--

# H1

- H2 Text
- H2
    - text

--

# H1 text

note
note
```

### Custom output markdown

You have to implement building module.

```shell
$ opml-to-markdown -e test/fixtures/header-list-note/test.opml --require lib/build-slide-markdown.js
```
