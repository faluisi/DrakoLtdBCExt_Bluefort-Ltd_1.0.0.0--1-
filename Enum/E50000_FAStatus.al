enum 50000 "FA Status"
{
    Extensible = true;
    AssignmentCompatibility = true;

    value(0; "A. Production") { Caption = 'A. In Production'; }
    value(1; "B. Transit") { Caption = 'B. In Transit'; }
    value(2; "C. stock") { Caption = 'C. In Stock (new machines)'; }
    value(3; "D. Installed Op.") { Caption = 'D. Installed Operative'; }
    value(4; "E. Installed Non-Op.") { Caption = 'E. Installed Non-Operative'; }
    value(5; "F. Non Installed") { Caption = 'F. Non-Installed Non-new Non-operative'; }
    value(6; "G. Kill") { Caption = 'G. For Kill'; }
    value(7; "H. Killed") { Caption = 'H. Killed'; }
}