function dx = sys(t,X)

    u = 0;
    dx = [X(3);
          X(4);
          (10185595158407927034375*cos(X(2))*sin(X(2)))/(1038710499531707908096*cos(X(2))^2+21588884096591721015625)-(16293497431389978125000*(u-(1921*sin(X(2))*X(4)^2)/80000))/(1038710499531707908096*cos(X(2))^2+21588884096591721015625);
          (562037005096949643750000*sin(X(2)))/(1038710499531707908096*cos(X(2))^2+21588884096591721015625)+(43257074420893614080000*cos(X(2))*(u-(1921*sin(X(2))*X(4)^2)/80000))/(1038710499531707908096*cos(X(2))^2+21588884096591721015625)];
end