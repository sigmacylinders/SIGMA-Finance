namespace GeneratedPermission;

permissionset 71100 SIGMAFINANCE
{
    Assignable = true;
    Permissions = tabledata "Bank Guarantee Header" = RIMD,
        tabledata "LC Header" = RIMD,
        table "Bank Guarantee Header" = X,
        table "LC Header" = X,
        codeunit "SIGMA Finance Subs" = X,
        page "Bank Guarantee Card" = X,
        page "Bank Guarantee List" = X,
        page "LC Card" = X,
        page "LC List" = X,
        tabledata "SIGMA Lookup - V2" = RIMD,
        table "SIGMA Lookup - V2" = X,
        page "SIGMA Lookup - V2" = X;
}