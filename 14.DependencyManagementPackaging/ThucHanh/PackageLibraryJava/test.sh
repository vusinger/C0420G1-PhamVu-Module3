#!/bin/bash
rm -rf build/main
cd src/main
javac org/usefullibs/greeter/impl/HelloWorld.java \
  -d ../../build/main \
  && echo 'Compiled org.usefullibs.greeter.impl.HelloWorld class!'
cd ../../build/main
jar cvf greeting.jar \
  org/usefullibs/greeter/Greeter.class \
  org/usefullibs/greeter/impl/HelloWorld.class