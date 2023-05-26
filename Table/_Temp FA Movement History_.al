// table 50004 "Temp FA Movement History"
// {
//   DataClassification = ToBeClassified;

//   fields
//   {
//     field(1;"Entry No.";Integer)
//     {
//       DataClassification = ToBeClassified;
//     //AutoIncrement = true;
//     }
//     field(2;"FA No.";Code[20])
//     {
//       DataClassification = ToBeClassified;
//       TableRelation = "Fixed Asset"."No.";
//     }
//     field(3;Site;Code[20])
//     {
//       DataClassification = ToBeClassified;
//       TableRelation = "Customer-Site"."Site Code";
//     }
//     field(4;"Corporate Name";Text[150])
//     {
//       DataClassification = ToBeClassified;
//     //TableRelation = Customer."Corporate Name";
//     }
//     field(5;Remarks;Text[250])
//     {
//       DataClassification = ToBeClassified;
//     }
//     field(6;"Date";Date)
//     {
//       DataClassification = ToBeClassified;
//     }
//     field(7;Indent;Integer)
//     {
//       DataClassification = ToBeClassified;
//     }
//     field(8;CustomerNo;Code[20])
//     {
//       DataClassification = ToBeClassified;
//     }
//   }
//   keys
//   {
//     key(PK;"Entry No.")
//     {
//       Clustered = true;
//     }
//   }
//   var trigger OnInsert()begin
//   end;
//   trigger OnModify()begin
//   end;
//   trigger OnDelete()begin
//   end;
//   trigger OnRename()begin
//   end;
// }
