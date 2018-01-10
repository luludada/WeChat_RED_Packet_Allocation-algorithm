close all;

clc;

clear all;

global leftMoneyPackage

MaxTestTimes = 30; % Set as 4*x for display;

row = 5;

col = MaxTestTimes / row;

figure;

for times = 1:MaxTestTimes
    
    leftMoneyPackage.peoples = 5;
    
    leftMoneyPackage.leftmoney = 30;
     
    n = leftMoneyPackage.peoples;
    
    cache = zeros(n,1);
    
    for i = 1:n
        
        cache(i) = getRandomMoney();
        
    end
    
    subplot(col, row,times);
    
    bar(cache, 'r');
    
end

function money = getRandomMoney()

    global leftMoneyPackage
    
    if (leftMoneyPackage.peoples == 1)
        
        leftMoneyPackage.peoples = 0;
         
        money =  round(leftMoneyPackage.leftmoney * 100) / 100;
         
    else 
        minGet = 0.01;
        
        maxGet = leftMoneyPackage.leftmoney / leftMoneyPackage.peoples * 2;
        
        r = random('Uniform', 0, 1);
        
        money = r * maxGet;
        
        if(money < minGet)
            
            money = minGet;
            
        end
    
         money = floor(money * 100) / 100;
         
         leftMoneyPackage.peoples =    leftMoneyPackage.peoples - 1;
         
         leftMoneyPackage.leftmoney =    leftMoneyPackage.leftmoney - money;
         
    end
    
end
        