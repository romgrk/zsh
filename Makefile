
RUNTIME = luajit

BIN = bin/prompt
SRC = src/prompt.moon


prompt:  	
	echo "#!/usr/bin/env $(RUNTIME)" >$(BIN) && \
	moonc -p $(SRC) >>$(BIN) 	   	 

clean:
	rm $(BIN)
