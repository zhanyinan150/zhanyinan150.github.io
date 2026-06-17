---
title: 欢迎来到我的博客
date: 2026-06-17 11:30:00
tags:
  - 公告
  - Hexo
categories:
  - 随笔
---

欢迎来到我的博客!这是一篇示范文章,你可以照着它的格式来写自己的内容。

<!-- more -->

## 关于这个博客

这个博客用 [Hexo](https://hexo.io/) 生成,搭配 [NexT](https://theme-next.js.org/) 主题,托管在 GitHub Pages 上。

## 写作格式说明

### 标题

用 `#` 号表示标题,一个 `#` 是一级标题,两个是二级,以此类推:

```markdown
## 二级标题
### 三级标题
```

### 文字样式

- **加粗文字**
- *斜体文字*
- ~~删除线~~
- `行内代码`
- [这是一个超链接](https://hexo.io/)

### 列表

无序列表:

- 第一项
- 第二项
  - 嵌套项

有序列表:

1. 第一步
2. 第二步
3. 第三步

### 代码块

用三个反引号包裹,可以指定语言高亮:

```python
def hello(name):
    print(f"Hello, {name}!")

hello("zhanyinan150")
```

```c
#include <stdio.h>

int main(void) {
    printf("Hello, World!\n");
    return 0;
}
```

### 引用

> 这是一段引用文字。
> 可以有多行。

### 表格

| 项目 | 说明 |
|------|------|
| 框架 | Hexo |
| 主题 | NexT Gemini |
| 托管 | GitHub Pages |

## 如何插入图片

因为你开启了 `post_asset_folder`,每篇文章都会有一个同名的文件夹(就在这篇文章旁边,叫 `欢迎来到我的博客`)。把图片放进那个文件夹,然后用下面这种写法引用:

```markdown
{% asset_img 图片文件名.jpg 图片说明文字 %}
```

或者在 Obsidian 里直接把图片拖进文章,Obsidian 会自动处理。

## front-matter(文章头部信息)说明

每篇文章开头的 `---` 之间这段叫 front-matter,是文章的元数据:

```yaml
---
title: 文章标题
date: 2026-06-17 11:30:00
tags:
  - 标签1
  - 标签2
categories:
  - 分类
---
```

- `title`:文章标题
- `date`:发布时间
- `tags`:标签(可多个,会出现在「标签」页)
- `categories`:分类(会出现在「分类」页)

## 摘要(首页只显示一部分)

你注意到了吗?这篇文章上面有一行 `<!-- more -->`。这行以上的内容会显示在博客首页作为摘要,点进文章才看得到全文。建议每篇文章都加上。

---

写完文章后,运行 `publish.ps1` 就能发布啦。开始你的写作之旅吧!
