---
layout: post
title: "Git Hook加强代码文档的尝试"
date: 2020-12-09 15:16:09 +0800
comments: true
categories: work 
---

## Motivation

给自己的代码写文档是件很容易被忽略的事情。
不过没有文档的话，不管是为了事后维护项目，还是帮助后续参与进来合作的小伙伴来说，都是很麻烦的事情。

这篇Blog是一个**非常简单的**用git hook中的pre-commit来做检查，强制对code和doc同时更新的一个小实验吧。

## Design

### 显示的文档清单

显示的文档清单，记录代码文件（比如.c, .h文件）和他们对应的文档文件（比如某.md）。

在git commit的时候，脚本去检查是否修改了该清单上的代码文件，如果有。
那么要么对应的文档文件也有更新，要么在commit的时候传入参数显示的告知脚本某些文档文件不需要更新。

### 为撒这么设计？

虽然文档很重要，但是对于大型项目，特别是在别人的系统上二次开发时，我们很难显示指定要对所有的代码文件做文档管理的。
（当然，如果能做到这肯定是件很好的事情）。
所以该清单其实是指定的一个要检查的列表。
这样，我们可以在创建新的相关的代码的时候，去更新该list和代码对应的文档。
后续的对代码的修改会通过脚本来提示我们需要去更新对应的文档内容。


## Implementation


Demo的[Github地址](https://github.com/Ddnirvana/codeWithDoc.git)。

**doclist.json**:
```
{
        "hello.c" : "docs/helloworld.md",
        "world.c" : "helloworld.md",
        "bye.c"   : "bye.md"
}
```

DocList的格式就简单按照Json，一组简单的键值对。
并且现在的假设是，一个代码文件**最多只有一个**对应的文档文件。
而一个文档文件可以被多个代码文件所关联。

**precommit的检查**：
```
changed_files = []
changed_files_dict = {}
for status, fname in git.status(filter="MA", cached=True):
    if args.verbose:
        print("Checking {}...".format(fname))
    if check_ignores(fname):
        continue
    changed_files.append(fname)
    changed_files_dict[fname] = 1

for fname in changed_files:
    doc = doc_of_the_code(fname)
    if (doc!='OMGNoDocFound') and (not changed_files_dict.get(doc)):
        print("Source file: ", fname,
                "is updated while its doc:", doc,
                "is not updated!\n")
        sys.exit(1)

sys.exit(0)
```
核心代码如上。
简单来说，就是读取修改的文件到一个List和Dict中（可能可以实现得更干净，先不管了），然后和doclist中的代码-文档对进行匹配和检查。
如果发现对应的代码有相关联的文档文件，但是没有同时更新的，就报错。

报错的log通常是：

	Source file:  hello.c is updated while its doc: helloworld.md is not updated!


## Evaluation

具体效果咋样，过一段时间再来更新~


