program PascalTriangle;
  type
  TLine = array[1..15] of Integer;

    procedure initialize_array(var arr: TLine );
    var i : integer;
    begin
      for i := 1 to 15 do
         arr[i] := 0;
    end;

procedure fill_line_to_n(var line: TLine; n: Integer);
var
  i: Integer;
begin
  if n = 1 then
    line[1] := 1
  else
  begin
    for i := n downto 2 do
      line[i] := line[i - 1] + line[i];
    line[1] := 1;  
  end;
end;

var n,i,j: integer;
var line: array [1..15] of integer;

begin
initialize_array(line);
ReadLn(n);
for i := 1 to n do
    begin
        fill_line_to_n(line,i);
        write(1);
        for j := 2 to i do
         begin
           write(' ',line[j])
         end;
         WriteLn();
    end;
end.
