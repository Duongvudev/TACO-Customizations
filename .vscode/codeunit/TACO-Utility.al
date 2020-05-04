codeunit 27014751 TACOUtility
{
    trigger OnRun()
    begin

    end;

    procedure FormatValue(pVariant: Variant): Text
    var
        Num: Integer;
        Dec: Decimal;
        Date: Date;
        DateTime: DateTime;
    begin
        IF pVariant.ISINTEGER THEN BEGIN
            Num := pVariant;
            IF Num < 0 THEN
                EXIT(FORMAT(Num, 0, '(<Integer>)'))
            ELSE
                EXIT(FORMAT(Num, 0, '<Integer>'));
        END;

        IF pVariant.ISDECIMAL THEN BEGIN
            Dec := pVariant;
            IF Dec < 0 THEN
                EXIT(FORMAT(Dec, 0, '(<Precision,2:9><Integer Thousand><1000Character,,><Decimals><Comma,.>)'))
            ELSE
                EXIT(FORMAT(Dec, 0, '<Precision,2:9><Integer Thousand><1000Character,,><Decimals><Comma,.>'));
        END;

        IF pVariant.ISDATE THEN BEGIN
            Date := pVariant;
            EXIT(FORMAT(Date, 0, '<Day,2>/<Month,2>/<Year4>'))
        END;
        IF pVariant.ISDATETIME THEN BEGIN
            DateTime := pVariant;
            EXIT(FORMAT(DateTime, 0, '<Day,2>/<Month,2>/<Year4>'))
        END;
    end;

    var
        myInt: Integer;


}