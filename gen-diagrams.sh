#!/bin/sh
java -Djava.awt.headless=true -jar plantuml.ajar -nometadata -tsvg -progress -r "doc/**.puml"