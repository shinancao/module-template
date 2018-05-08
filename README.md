# 为什么会有这个脚本

来到我司以后接到个活，要把原来的h5页面原生化。它的特点是页面量大，页面元素多，但是里面要处理的逻辑和状态都不算复杂。在把一些通用的东西进行了封装后，我发现每开始新做一个模块时，要创建的该模块的分组、一些基本的类都是一样的，类与类之间的调用都是一样的，所以我就想能在开始新做一个模块时不用总是重复创建这些分组和类，运行个脚本就搞定，我只要在里面写跟这个模块紧密相关的业务逻辑就好。很简单的一个脚本，却不用我总是写这些重复的东西了，时间也可以被节省下来。

# 如果你也想用

* 在`templates`文件夹下创建module的通用文件，文件名中根据不同模块变化的部分`_MODULE_`代替。注意修改文件头部的注释，时间用`${DATE}`，年份用`${YEAR}`，这样会被替换成脚本执行时的时间。可参考`templates/MODULE_Demo`。

* 脚本就是把你创建的模板文件夹复制一份，然后修改其中的`_MODULE_`、`${DATE}`、`${YEAR}`。

* 运行脚本：

```ruby
> git clone git@github.com:shinancao/module-template.git
> cd module-template
> ./configure.rb GoodsList MODULE_Demo
```

把上面的`GoodsList`换成你要生成的模块的名称，把`MODULE_Demo`换成你在`templates`下创建的模板文件夹。

