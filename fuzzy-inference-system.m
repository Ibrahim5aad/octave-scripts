fis = newfis('TestFIS', 'mamdani', 'min', 'max','min','max', 'centroid', 1.0)

# Varaibles:
# INPUTS:                 OUTPUT:
#     service, food            tips
fis = addvar (fis, 'input', 'service', [0 10])
fis = addvar (fis, 'input', 'food', [0 10])
fis = addvar (fis, 'output', 'tips', [0 30])

#Membership functions for each varible

#Inputs MFs
fis = addmf (fis, 'input', 1, 'poor', 'gaussmf', [1.5 0])
fis = addmf (fis, 'input', 1, 'good', 'gaussmf', [1.5 5])
fis = addmf (fis, 'input', 1, 'excellent', 'gaussmf', [1.5 10])

fis = addmf (fis, 'input', 2, 'rancid', 'trapmf', [-1 0 1 3])
fis = addmf (fis, 'input', 2, 'delicious', 'trapmf', [7 9 10 11])

#Output MFs
fis = addmf (fis, 'output', 1, 'cheap', 'trimf', [0 5 10])
fis = addmf (fis, 'output', 1, 'avg', 'trimf', [10 15 20])
fis = addmf (fis, 'output', 1, 'generous', 'trimf', [20 25 30])

#Functions plots
plotmf (fis, 'input', 1);
plotmf (fis, 'input', 2);
plotmf (fis, 'output', 1);

#RULES is defined by a RULE MATRIX
fis = addrule (fis, [1 1 1 1 2; 2 0 2 1 2; 3 2 3 1 2])
showrule(fis)

#FIS surface
gensurf (fis)


#Testing the system
output1 = evalfis ([4 6], fis)
output2 = evalfis ([5 5], fis)


