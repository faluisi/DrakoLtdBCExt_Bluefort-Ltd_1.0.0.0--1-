// page 50005 "Current Customer FA per Site"
// {
//   PageType = List;
//   ApplicationArea = All;
//   UsageCategory = Lists;
//   SourceTable = "FA Movement History";
//   SourceTableTemporary = true;

//   layout
//   {
//     area(Content)
//     {
//       repeater(Control1)
//       {
//         ShowCaption = false;

//         field("Corporate Name";"Corporate Name")
//         {
//           ApplicationArea = All;
//           Style = Strong;
//           StyleExpr = isHeader;
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
//   procedure InitTempTable()var FAMH: Record "FA Movement History";
//   FANo: array[100000]of Code[20];
//   i: Integer;
//   found: Boolean;
//   MH: Record "FA Movement History";
//   counter: Integer;
//   j: Integer;
//   begin
//     FAMH.Reset();
//     if FAMH.FindLast()then counter:=FAMH."Entry No.";
//     FAMH.Reset();
//     Clear(FANo);
//     FAMH.SetCurrentKey("FA No.");
//     if FAMH.FindFirst()then begin
//       repeat begin
//         //check if last FA movement was already found
//         for i:=1 to ArrayLen(FANo)do begin
//           if FANo[i] = FAMH."FA No." then begin
//             found:=true;
//             Message('%1 - %2', FAMH."Entry No.", found);
//             i:=ArrayLen(FANo);
//           end
//           else
//             found:=false;
//         end;
//         if not found then begin
//           Message('Not found - %1', FAMH."Entry No.");
//           mh.Reset();
//           mh.SetCurrentKey("Date");
//           MH.SetFilter(MH."FA No.", FAMH."FA No.");
//           if mh.FindLast()then begin
//             Rec:=MH;
//             Rec."Entry No.":=counter + 1;
//             counter:=counter + 1;
//             if Insert()then begin
//               //record Fa No in array
//               for j:=1 to ArrayLen(FANo)do begin
//                 if FANo[j] = '' then begin
//                   FANo[j]:=MH."FA No.";
//                   j:=ArrayLen(FANo);
//                 end;
//               end;
//             end;
//           end;
//         end;
//       end;
//       until(FAMH.Next = 0);
//     //get first FA
//     end;
//   end;
//   trigger OnOpenPage()begin
//     InitTempTable();
//   /*var
//             FAMH: Record "FA Movement History";
//             FANos: Array[100000] of Code[20];
//             i: Integer;
//             found: Boolean;
//             MovementHistory: Record "FA Movement History";
//         begin
//             Clear(FANos);
//             FAMH.Reset();
//             found := false;
//             FAMH.SetCurrentKey("FA No.");
//             if FAMH.FindFirst() then begin
//                 repeat begin
//                     //check if FA already looked for
//                     for i := 1 to ArrayLen(FANos) do begin
//                         if FANos[i] = FAMH."FA No." then begin
//                             found := true;
//                             i := ArrayLen(FANos);
//                         end;
//                     end;

//                     if not found then begin
//                         MovementHistory.Reset();
//                         MovementHistory.SetFilter(MovementHistory."FA No.", FAMH."FA No.");
//                         if MovementHistory.FindLast() then


//                     end;
//                     end;
//                 until(FAMH.Next = 0)
//             end;
//             */
//   end;
//   local procedure GetCustNo(CorpName: Text[250])CustNo: Code[20];
//   var cust: Record Customer;
//   begin
//     cust.SetFilter(cust."Corporate Name", CorpName);
//     if cust.FindFirst()then CustNo:=cust."No."
//     else
//       CustNo:='';
//   end;
// }
