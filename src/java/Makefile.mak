################################################################
# Build jpl.jar
################################################################

.SUFFIXES: .java .class

JAVAC=$(JAVA_HOME)\bin\javac
JAR=$(JAVA_HOME)\bin\jar
JPL=..\..\jpl.jar

CLS=	jpl\Atom.java \
	jpl\Compound.java \
	jpl\Float.java \
	jpl\Integer.java \
	jpl\JBoolean.java \
	jpl\JPLException.java \
	jpl\JPL.java \
	jpl\JRef.java \
	jpl\JVoid.java \
	jpl\PrologException.java \
	jpl\Query.java \
	jpl\Term.java \
	jpl\Util.java \
	jpl\Variable.java \
	jpl\Version.java

FLI=	jpl\fli\atom_t.java \
	jpl\fli\BooleanHolder.java \
	jpl\fli\DoubleHolder.java \
	jpl\fli\engine_t.java \
	jpl\fli\fid_t.java \
	jpl\fli\functor_t.java \
	jpl\fli\IntHolder.java \
	jpl\fli\LongHolder.java \
	jpl\fli\module_t.java \
	jpl\fli\ObjectHolder.java \
	jpl\fli\PointerHolder.java \
	jpl\fli\predicate_t.java \
	jpl\fli\Prolog.java \
	jpl\fli\qid_t.java \
	jpl\fli\StringHolder.java \
	jpl\fli\term_t.java

JAVA=$(FLI) $(CLS)
CLASSES=$(JAVA:.java=.class)

all:	$(JPL)

$(JPL):	$(JAVA)
	$(JAVAC) $(JAVA)
	$(JAR) cf $(JPL) $(CLASSES)

clean::
	if exist jpl\*.class del jpl\*.class
	if exist jpl\fli\*.class del jpl\fli\*.class
	if exist *~ del *~

distclean:	clean
	if exist $(JPL) del $(JPL)
