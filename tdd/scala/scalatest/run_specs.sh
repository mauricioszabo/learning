#!/bin/bash

arg="$1"
subst=${arg//\//\.}
scalac -cp scalatest-1.1.jar:mockito-all-1.8.5.jar $1.scala && 
    scala -cp scalatest-1.1.jar:mockito-all-1.8.5.jar org.scalatest.tools.Runner -p . -o -s $subst
