---
title: markdown书写
date: 2023/04/06/ 11:49:04
discription: 
tags:
updated:
type:
comments:
description:
keywords:
top_img:
mathjax: true
katex:
aside:
aplayer:
highlight_shrink:
sticky:
cover:
---

### 普通版

```markdown
---
title: centos7
date: 2023/04/06/ 11:49:04
discription: 
tags:
updated:
type:
comments:
description:
keywords:
top_img:
mathjax: true
katex:
aside:
aplayer:
highlight_shrink:
sticky:
cover:
---
```



### VS Code版

```json
"head": {
  "prefix": "head",
  "body": [
    "---",
    "title: $TM_FILENAME_BASE",
    "date: $CURRENT_YEAR/$CURRENT_MONTH/$CURRENT_DATE/ $CURRENT_HOUR:$CURRENT_MINUTE:$CURRENT_SECOND",
    "discription: ",
    "tags:",
    "updated:",
    "type:",
    "comments:",
    "description:",
    "keywords:",
    "top_img:",
    "mathjax: true",
    "katex:",
    "aside:",
    "aplayer:",
    "highlight_shrink:",
    "sticky:",
    "cover:",
    "---"
  ],
  "description": ""
}
```

