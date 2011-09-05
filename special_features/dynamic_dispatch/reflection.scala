val string = "A string"
val methods = string.getClass.getMethods
val Some(method) = methods.find( m => m.getName == "toUpperCase" && m.getParameterTypes.length == 0 )

println(method.invoke(string))
