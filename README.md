Calculator
==========

Alex Vaccarino

Calculator psuedo-code:



tokens[] = parseString(input);

for(i=0; i < tokens.size; i++){
    /* Place numbers and operators on two separate stack objects, 
       maintaining proper arithmetic priority.  This way, the expression can be
       simplified down to a solution by popping from and pushing to each stack. 
       Note: the numbers will be converted from string/char to int before being
       pushed to the number stack */
}

while(!oStack.isEmpty){
    int left = nStack.pop;
    int right = nStack.pop;
    int sol;
    char oper = oStack.pop;

    /* Use a switch case statement for oper to determine what type of arithmetic
       is to be performed on the two numbers popped from the number stack,
       storing the solution in sol */

    /* Push sol to the number stack */
}

/* The stack should have one number left, i.e. the output. The final code
   will include checks on the validity of input to ensure that this always
   is the case */

print(">> %d", nStack.pop);
