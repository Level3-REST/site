#!/bin/sh
java -Djava.awt.headless=true -jar plantuml.ajar -nbthread auto -nometadata -tsvg -progress -r "doc/**.puml"