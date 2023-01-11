table 50000 TermsConditions
{
  DataClassification = ToBeClassified;

  fields
  {
    field(1;Country;Code[10])
    {
      DataClassification = ToBeClassified;
      TableRelation = "Country/Region".Code;
    }
    field(2;"Line No.";Integer)
    {
      DataClassification = ToBeClassified;
      AutoIncrement = true;
    }
    field(3;"Terms Conditions";Text[1000])
    {
    }
  }
  keys
  {
    key(PK;"Line No.", country)
    {
      Clustered = true;
    }
  }
  var trigger OnInsert()begin
  end;
  trigger OnModify()begin
  end;
  trigger OnDelete()begin
  end;
  trigger OnRename()begin
  end;
}
