

PROJECT_NAME= all.out
SRC= test.c\
src/sum.c\
src/sqr.c
INC =inc
$(PROJECT_NAME) : $(SRC)
	gcc -I$(INC) $(SRC)  -o all.out

run : $(PROJECT_NAME)
	./$(PROJECT_NAME)

clean : 
	rm *.out
	rm *.gcov
	rm *.gcda
	rm *.gcno

staticcheck:
	cppcheck --enable=all *.c

memcheck:
	valgrind ./$(PROJECT_NAME)
coverage:$(SRC) $(INC)
	gcc -fprofile-arcs -ftest-coverage $(SRC) -I$(INC) -o $(PROJECT_NAME)
	./$(PROJECT_NAME)
	gcov -a test.c sum.c sqr.c
	
