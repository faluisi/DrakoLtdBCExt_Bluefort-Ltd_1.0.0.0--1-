tableextension 50004 DimensionValueExt extends "Dimension Value"
{
  fields
  {
    field(50000;"Parent Dimension";Code[20])
    {
      Caption = 'Parent Dimension';
      TableRelation = Dimension.Code;
    }
    field(50001;"Parent Code";Code[20])
    {
      Caption = 'Parent Code';
    }
  }
  var trigger OnInsert()var begin
  end;
}
