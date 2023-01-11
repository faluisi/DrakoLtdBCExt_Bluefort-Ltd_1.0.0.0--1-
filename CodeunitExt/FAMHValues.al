codeunit 50002 FAMHValues
{
  SingleInstance = true;

  trigger OnRun()begin
  end;
  var FixedAssetNo: Code[20];
  procedure SetFANo(FANo: Code[20])var begin
    FixedAssetNo:=FANo;
  end;
  procedure GetFANo(): Code[20]begin
    exit(FixedAssetNo);
  end;
  procedure ClearValues()begin
    FixedAssetNo:='';
  end;
}
