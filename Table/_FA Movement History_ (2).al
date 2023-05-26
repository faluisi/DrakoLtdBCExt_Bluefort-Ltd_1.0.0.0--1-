// table 50002 "FA Movement History"
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "Entry No."; Integer)
//         {
//             DataClassification = ToBeClassified;
//             AutoIncrement = true;
//         }
//         field(2; "FA No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Fixed Asset"."No.";
//         }
//         field(3; Site; Text[250])
//         {
//             DataClassification = ToBeClassified;
//             //TableRelation = "Customer-Site"."Site Name";
//         }
//         field(4; "Corporate Name"; Text[150])
//         {
//             //this is equal to operator name
//             DataClassification = ToBeClassified;
//         }
//         field(5; "Date From"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(6; "Date To"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(7; Remarks; Text[250])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(8; "Date"; Date)
//         {
//             //workdate
//             DataClassification = ToBeClassified;
//         }
//         field(9; Status; Text[250])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(10; "Stock Arrival"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(11; "Forecast Dep. Date"; Text[50])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(12; "Type"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(13; "Version"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(14; "Customer Name"; Text[250])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(15; "Start Dep. Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(16; "Site Code"; Code[20])
//         {
//             DataClassification = ToBeClassified;

//         }
//         field(17; "Operator Code"; Code[20])
//         {
//             DataClassification = ToBeClassified;

//         }
//     }
//     keys
//     {
//         key(PK; "Entry No.")
//         {
//             Clustered = true;
//         }
//     }
//     var
//     trigger OnInsert()
//     begin
//     end;

//     trigger OnModify()
//     begin
//     end;

//     trigger OnDelete()
//     begin
//     end;

//     trigger OnRename()
//     begin
//     end;
// }
