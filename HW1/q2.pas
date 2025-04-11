
program q2;

type
  CharMap = array['0'..'9', 'a'..'z'] of char;
  BoolMap = array['0'..'9', 'a'..'z'] of boolean;

var
  origLine, encLine, toDecode: string;
  map: array[char] of char;
  used: array[char] of boolean;
  i: integer;
  c: char;
  c2: char;
  found: boolean;
  fromList, toList: string;

function isValidChar(ch: char): boolean;
begin
  isValidChar := ((ch >= 'a') and (ch <= 'z')) or ((ch >= '0') and (ch <= '9'));
end;

begin
  readln(origLine);
  readln(encLine);
  readln(toDecode);

  for c := '0' to '9' do
  begin
    map[c] := '?';
    used[c] := false;
  end;

  for c := 'a' to 'z' do
  begin
    map[c] := '?';
    used[c] := false;
  end;

  for i := 1 to length(origLine) do
    if isValidChar(origLine[i]) and isValidChar(encLine[i]) then
      if not used[origLine[i]] then
      begin
        map[origLine[i]] := encLine[i];
        used[origLine[i]] := true;
      end;

  for i := 1 to length(toDecode) do
  begin
    c := toDecode[i];
    if c = ' ' then
      write(' ')
    else
    begin
      found := false;
      for c2 := '0' to '9' do
        if map[c2] = c then
        begin write(c2); found := true; break; end;
      if not found then
        for c2 := 'a' to 'z' do
          if map[c2] = c then
          begin write(c2); found := true; break; end;
      if not found then
        write('?');
    end;
  end;
  writeln;

  fromList := '';
  toList := '';
  for c := '0' to '9' do
    if used[c] then
    begin
      fromList := fromList + c;
      toList := toList + map[c];
    end;
  for c := 'a' to 'z' do
    if used[c] then
    begin
      fromList := fromList + c;
      toList := toList + map[c];
    end;

  writeln('From: ', fromList);
  writeln('To:   ', toList)
end.
