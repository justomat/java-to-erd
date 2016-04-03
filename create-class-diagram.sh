#!/bin/bash

IMAGE_NAME='class'
PACKAGE_NAME='com.iluwatar.composite'
PACKAGE_PATH='src/main/java'
UMLGRAPH_PATH='/usr/local/lib/UmlGraph.jar'


java \
    -classpath "${UMLGRAPH_PATH}:${JAVA_HOME}/lib/tools.jar" org.umlgraph.doclet.UmlGraph \
    -sourcepath ${PACKAGE_PATH} ${PACKAGE_NAME}
dot -Gratio=0.7 -Eminlen=2 -Tpng -o${IMAGE_NAME}.png graph.dot
