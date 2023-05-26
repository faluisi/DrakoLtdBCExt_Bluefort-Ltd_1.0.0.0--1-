// page 50004 "Customer FA per Site"
// {
//   PageType = List;
//   //ApplicationArea = All;
//   //UsageCategory = Lists;
//   SourceTable = "Temp FA Movement History";

//   layout
//   {
//     area(Content)
//     {
//       repeater(Control1)
//       {
//         IndentationColumn = Indent;
//         IndentationControls = "Corporate Name";
//         ShowAsTree = true;
//         ShowCaption = false;

//         field("Corporate Name";"Corporate Name")
//         {
//           ApplicationArea = All;
//           Style = Strong;
//           StyleExpr = isHeader;
//         }
//         field(CustomerNo;CustomerNo)
//         {
//           ApplicationArea = All;
//         }
//         field("Date";"Date")
//         {
//           ApplicationArea = All;
//         }
//         field("FA No.";"FA No.")
//         {
//           ApplicationArea = All;
//         }
//         field(Site;Site)
//         {
//           ApplicationArea = All;
//         }
//         field(Remarks;Remarks)
//         {
//           ApplicationArea = All;
//         }
//         field(Indent;Indent)
//         {
//           ApplicationArea = All;
//           Visible = false;
//         }
//       }
//     }
//     area(Factboxes)
//     {
//     }
//   }
//   actions
//   {
//   }
//   var isHeader: Boolean;
//   trigger OnOpenPage()var FAMH: Record "FA Movement History";
//   temp: Record "Temp FA Movement History";
//   Cust: Record Customer;
//   FixedAssetMH: Record "FA Movement History";
//   insertedFAMH: Record "Temp FA Movement History";
//   counter: Integer;
//   begin
//     //fill temp table
//     counter:=1;
//     FAMH.SetCurrentKey("Corporate Name");
//     temp.DeleteAll();
//     if FAMH.FindFirst()then begin
//       //Message('FAMH %1', FAMH."Entry No.");
//       repeat begin
//         insertedFAMH.Reset();
//         insertedFAMH.SetFilter(insertedFAMH."Corporate Name", FAMH."Corporate Name");
//         /*if insertedFAMH.FindFirst() then begin
//                     Message('Inserted FAMH %1 %2 - FAMH %3', insertedFAMH."Entry No.", insertedFAMH."Corporate Name", FAMH."Entry No.");
//                     //FAMH.Next();
//                 end*/
//         if not insertedFAMH.FindFirst()then begin
//           temp.init;
//           temp."Entry No.":=counter;
//           temp."Corporate Name":=FAMH."Corporate Name";
//           temp.CustomerNo:=GetCustNo(FAMH."Corporate Name");
//           temp.Site:='';
//           temp."FA No.":='';
//           temp.Remarks:='';
//           temp."Date":=0D;
//           temp.Indent:=1;
//           temp.Insert(true); // then
//           //Message('Inserted Main %1 %2 %3', temp."Corporate Name", temp.CustomerNo, temp.Indent)
//           //else
//           //Message('main failed %1', FAMH."Entry No.");
//           counter:=counter + 1;
//           FixedAssetMH.Reset();
//           FixedAssetMH.SetFilter(FixedAssetMH."Corporate Name", FAMH."Corporate Name");
//           if FixedAssetMH.FindSet()then begin
//             //Message('Started Entries');
//             //Message('%1', FixedAssetMH."Entry No.");
//             repeat begin
//               temp.Reset();
//               temp.Init();
//               temp."Entry No.":=counter;
//               temp."Corporate Name":=FixedAssetMH."Corporate Name";
//               temp.CustomerNo:=GetCustNo(FixedAssetMH."Corporate Name");
//               temp."FA No.":=FixedAssetMH."FA No.";
//               temp.Site:=FixedAssetMH.Site;
//               temp.Remarks:=FixedAssetMH.Remarks;
//               temp."Date":=FixedAssetMH."Date";
//               temp.Indent:=2;
//               temp.Insert(); // then
//               // Message('Inserted Entry %1 %2 %3 %4', temp."FA No.", temp.Site, temp.Indent, temp.Remarks)
//               //else
//               // Message('failed');
//               counter:=counter + 1;
//             end;
//             until(FixedAssetMH.Next = 0)end;
//         end;
//       end;
//       until(FAMH.Next = 0);
//     end;
//   end;
//   local procedure GetCustNo(CorpName: Text[250])CustNo: Code[20];
//   var cust: Record Customer;
//   begin
//     cust.SetFilter(cust."Corporate Name", CorpName);
//     if cust.FindFirst()then CustNo:=cust."No."
//     else
//       CustNo:='';
//   end;
//   local procedure SetStyle()var begin
//     if Indent = 1 then isHeader:=true
//     else
//       isHeader:=false;
//   end;
//   trigger OnAfterGetRecord()begin
//     SetStyle();
//   end;
// }
