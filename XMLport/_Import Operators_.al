xmlport 50001 "Import Operators"
{
  Direction = Import;
  Format = VariableText;
  RecordSeparator = '<LF>';
  FieldSeparator = ',';
  TextEncoding = UTF8;

  schema
  {
  textelement(Root)
  {
  tableelement(OperatorDim;
  "Dimension Value")
  {
  fieldelement(OperatorName;
  OperatorDim.Name)
  {
  }
  fieldelement(CustomerNo;
  OperatorDim."Parent Code")
  {
  }
  trigger OnBeforeInsertRecord()var FASetup: Record "FA Setup";
  OpCode: Code[20];
  begin
    FASetup.Get();
    //check that operator is not linked to a different customer
    OperatorDim."Dimension Code":=FASetup."Operator Dimension";
    OpCode:=UniqueOperator();
    if OpCode = '' then OperatorDim."Code":=NoSeriesMgt.GetNextNo('OPERATORS', Today, true)
    else
      OperatorDim."Code":=OpCode;
  end;
  }
  }
  }
  requestpage
  {
  }
  var NoSeriesMgt: codeunit "NoSeriesManagement";
  procedure UniqueOperator()OpCode: Code[20]var OperatorDimension: Record "Dimension Value";
  FASetup: Record "FA Setup";
  begin
    OperatorDimension.Reset();
    OperatorDimension.SetFilter(OperatorDimension."Dimension Code", FASetup."Operator Dimension");
    OperatorDimension.SetFilter(OperatorDimension.Name, OperatorDim.Name);
    if OperatorDimension.FindFirst()then OpCode:=OperatorDimension.Code
    else
      OpCode:='';
    exit(OpCode);
  end;
}
