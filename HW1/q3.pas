program q3;

uses SysUtils;

// stack structure and functions:
type stack = record 
  top: integer;
  data: array[1..1000] of integer;
end;

procedure init(var s : stack);
begin
  s.top := 0;
end;

procedure push(var s : stack ; n : integer); 
begin
  s.top := s.top + 1; 
  s.data[s.top] := n;
end;

function pop(var s : stack) : integer;
begin
  pop := s.data[s.top];
  s.top := s.top - 1;
end;

function front(var s : stack) : integer;
begin
  front := s.data[s.top];
end;

procedure dump(var s : stack);
var
  i: integer;
begin
  write('Stack: ');
  for i := 1 to s.top do
   begin
    write(s.data[i], ' ');
   end;
  writeln;
end;
// end of stack structure and functions


var
  s: stack;
  lines: array[0..999] of string;
  pc, numLines: integer;
  i, a, b: integer;

begin
  init(s);
  numLines := 0;
  pc := 0;

  while not eof do
  begin
    readln(lines[numLines]);
    numLines := numLines + 1;
  end;

  while pc <= numLines do
  begin

    if lines[pc] = 'LOAD' then
    begin
      pc := pc + 1;
      push(s, StrToInt(lines[pc]));
      pc := pc + 1;
    end

    else if lines[pc] = 'ADD' then 
    begin
      a := pop(s);
      b := pop(s);
      push(s, a + b);
      pc := pc + 1;
    end

    else if lines[pc] = 'SUB' then
    begin
      a := pop(s);
      b := pop(s);
      push(s, b - a);
      pc := pc + 1;
    end

    else if lines[pc] = 'DUP' then
    begin
      a := front(s);
      push(s, a);
      pc := pc + 1;
    end

    else if lines[pc] = 'Write' then
    begin
      a := pop(s);
      writeln(a);
      pc := pc + 1;
    end

    else if lines[pc] = 'JNZ' then
    begin
      a := pop(s);
      pc := pc + 1;
      if a <> 0 then
      begin
        i := StrToInt(lines[pc]);
        pc := i;
      end
      else
        pc := pc + 1;
    end

    else if lines[pc] = 'WRITE_STACK' then
    begin
      dump(s);
      pc := pc + 1;
    end

    else
    begin
      pc := pc + 1;
    end;

  end;

end.