{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
program Instant;
uses
  dcgen,
  MainUnit,
  uFrmForms in 'uFrmForms.pas' {frmGridForms},
  uDM in 'uDM.pas' {dmTouche: TDataModule};

{$R *.REs}

begin
  InitInstant;
  FreePropEditors;
end.

