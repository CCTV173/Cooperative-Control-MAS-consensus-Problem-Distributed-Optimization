%% Guass-seidel pass;
function x=guass_seidel(L,U,b,x,iters)
      for i = 1:iters
        for j = 1:size(L,1)
            x=inv(L)*(b-U*x);
        end
      end
end