function memo = memoryfunc

%MONITOR_MEMORY_WHOS uses the WHOS command and evaluates inside the BASE
%workspace and sums up the bytes.  The output is displayed in bytes.



meme = evalin('caller' , 'whos');
memo = sum([meme(:).bytes]);

if nargout == 0
    
  disp(['Memo ' , num2str(memo, '%.0f') , ' Bs'])
  clear memo
  
  
% Function finish running
end