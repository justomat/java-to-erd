# Author:  Vadim Nasardinov (vadimn@redhat.com)
# Since:   2004-05-26
# See:     http://www.spinellis.gr/sw/umlgraph/doc/ceg-mv.html

# Requires: graphviz
# Requires: javadoc
# Requires: JAVA_HOME/lib/tools.jar

.PHONY : clean all dot png

UMLGRAPH  := /Users/ger/Downloads/UMLGraph-5.7_2.3-SNAPSHOT
uml_graph := $(UMLGRAPH)/lib/UmlGraph.jar

java_files := $(shell find -name '*.java')
dot_files  := $(subst .java,.dot,$(java_files))
dot_files  := $(foreach dot, $(dot_files), build/$(dot))
dot_files  += $(subst .dot,-small.dot,$(dot_files))

png_files := $(subst .dot,.png,$(dot_files))

jd:=javadoc
jd_flags := -docletpath $(uml_graph) -doclet org.umlgraph.doclet.UmlGraph -private

jd_flags += -nodefontsize 9 -edgefontsize 9
jd_flags += -nodefillcolor LemonChiffon
detailed_flags := -attributes -operations -types

all: png

clean:
		rm -rf build

build/%.dot : %.java
		mkdir -p $(dir $@)
		$(jd) $(jd_flags) $(detailed_flags) -output $@ $<

build/%-small.dot : %.java
		mkdir -p $(dir $@)
		$(jd) $(jd_flags) -output $@ $<

%.png : %.dot
		dot -Nheight=0.2 -Elabelfontcolor=DarkSlateBlue -Elabelfontsize=8 -Tpng -o $@ $<

build/%.png : %.fig
		mkdir -p $(dir $@)
		fig2dev -L png -S 4 $< $@

dot: $(dot_files)

png: $(png_files)

build/%.png : %.png
		mkdir -p $(dir $@)
		cp $< $@

# Example usage:
#   make debug-java_files
#   make debug-png_files
debug-%:
		@echo $* is $($*)