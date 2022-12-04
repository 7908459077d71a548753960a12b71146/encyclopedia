## 发现 Scala 的一个 bug

*2022-10-13*

在了解 scala 完整个语言的基本语法后，开始通读 List 类的所有 API 接口，通过命令行边敲边学习，发现使用 <code>indexof</code> 这个接口时，如果给的下标是负数，则会返回一个没有意义的值。  

```scala
scala> List(1,3,5,8).indexOf(8,-2)
res393: Int = 1

scala> List(1,3,5,8).indexOf(8,-3)
res391: Int = 0
```

于是在 StackOverflow 社区提问这个[问题](https://stackoverflow.com/questions/41395111/scala-list-indexof-has-bug)，很快有人作答（应该是 Scala 社区的一个贡献者）说这是一个 bug，并且一并提交了新的修复[合并](https://github.com/scala/scala/pull/5621/files/a75e4a7fafef9ce619a8d0f0622333d20502e7c8)，从修改来看很简单，就是查找前，把入参的下标和 0 取最大值。  

刚刚安装最新的版本，再使用相同的命令，已经可以返回正确的结果。

```scala
scala> List(1,3,5,8).indexOf(8,-2)
res0: Int = 3
```

整个过程唯一的遗憾，就是当时对 scala 源码不熟，不然自己可以提一个合并，以后就可以假装自己是 scala 的贡献者了。;-)