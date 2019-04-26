{******************************************************
 *                                                    *
 * Fingerprint SDK                                    *
 *                                                    *
 * GrFinger.pas                                       *
 * pascal file for GrFinger Library                   *
 *                                                    *
 * Copyright (c) 2004-2007 Griaule Biometrics LTDA.   *
 *                                                    *
 * Last Modified: 2006-05-23 Revision: 3              *
 *                                                    *
 ******************************************************}

unit GrFinger;

interface

uses
  Windows;

const

//*****************************************************
//RETURN CODES
//*****************************************************
//success
GR_OK =                                              0;
GR_BAD_QUALITY =                                     0;
GR_MEDIUM_QUALITY =                                  1;
GR_HIGH_QUALITY =                                    2;
GR_MATCH =                                           1;
GR_NOT_MATCH =                                       0;
GR_DEFAULT_USED =                                    3;
GR_ENROLL_NOT_READY =                                0;
GR_ENROLL_SUFFICIENT =                               1;
GR_ENROLL_GOOD =                                     2;
GR_ENROLL_VERY_GOOD =                                3;
GR_ENROLL_MAX_LIMIT_REACHED =                        4;
//initialization errors codes
GR_ERROR_INITIALIZE_FAIL =                          -1;
GR_ERROR_NOT_INITIALIZED =                          -2;
GR_ERROR_FAIL_LICENSE_READ =                        -3;
GR_ERROR_NO_VALID_LICENSE =                         -4;
GR_ERROR_NULL_ARGUMENT =                            -5;
GR_ERROR_FAIL =                                     -6;
GR_ERROR_ALLOC =                                    -7;
GR_ERROR_PARAMETERS =                               -8;
//extract and match errors codes
GR_ERROR_WRONG_USE =                              -107;
GR_ERROR_EXTRACT =                                -108;
GR_ERROR_SIZE_OFF_RANGE =                         -109;
GR_ERROR_RES_OFF_RANGE =                          -110;
GR_ERROR_CONTEXT_NOT_CREATED =                    -111;
GR_ERROR_INVALID_CONTEXT =                        -112;
GR_ERROR_ERROR =                                  -113;
GR_ERROR_NOT_ENOUGH_SPACE =                       -114;
GR_ERROR_BAD_QUALITY =                            -115;
//capture error codes
GR_ERROR_CONNECT_SENSOR =                         -201;
GR_ERROR_CAPTURING =                              -202;
GR_ERROR_CANCEL_CAPTURING =                       -203;
GR_ERROR_INVALID_ID_SENSOR =                      -204;
GR_ERROR_SENSOR_NOT_CAPTURING =                   -205;
GR_ERROR_INVALID_EXT =                            -206;
GR_ERROR_INVALID_FILENAME =                       -207;
GR_ERROR_INVALID_FILETYPE =                       -208;
GR_ERROR_SENSOR =                                 -209;
//license error codes
GR_ERROR_GET_HARDWARE_KEY =                       -301;
GR_ERROR_INTERNET_CONNECTION =                    -302; 
GR_ERROR_BAD_REQUEST =                            -303;
GR_ERROR_INVALID_PRODUCT_KEY =                    -304;
GR_ERROR_INSUFFICIENT_CREDIT =                    -305;
GR_ERROR_NO_HARDWARE_BOUND =                      -306;
GR_ERROR_HTTP_AUTHORIZATION =                     -307;
GR_ERROR_WRONG_PRODUCT_KEY =                      -308;
GR_ERROR_INTERNAL_SERVER =                        -309;
GR_ERROR_WRITING_LICENSE_FILE =                   -310;
GR_ERROR_PK_NOT_LINKED =                          -311;
GR_ERROR_PK_NOT_APPROVED =                        -312;

//*****************************************************
//CONSTS
//*****************************************************
//file format codes
GRCAP_IMAGE_FORMAT_BMP =                           501;

//event values codes
GR_PLUG =                                           21;
GR_UNPLUG =                                         20;
GR_FINGER_DOWN =                                    11;
GR_FINGER_UP =                                      10;
GR_IMAGE =                                          30;
//image consts
GR_DEFAULT_RES =                                   500;
GR_DEFAULT_DIM =                                   500;
GR_MAX_SIZE_TEMPLATE =                           10000;
GR_MAX_IMAGE_WIDTH =                              1280;
GR_MAX_IMAGE_HEIGHT =                             1280;
GR_MAX_RESOLUTION =                               1000; // DPI
GR_MIN_IMAGE_WIDTH =                                50;
GR_MIN_IMAGE_HEIGHT =                               50;
GR_MIN_RESOLUTION =                                125; // DPI
//match const
GR_MAX_THRESHOLD =                                 200;
GR_MIN_THRESHOLD =                                  10;
GR_VERYLOW_FRR =                                    30; // 1 IN 1000
GR_LOW_FRR =                                        45; // 1 IN 10000
GR_LOW_FAR =                                        60; // 1 IN 30000
GR_VERYLOW_FAR =                                    80; // 1 IN 300000
GR_ROT_MIN =                                         0;
GR_ROT_MAX =                                       180;
//context const
GR_DEFAULT_CONTEXT =                                 0;
GR_NO_CONTEXT =                                     -1;
//colors for BiometricDisplay
GR_IMAGE_NO_COLOR =                          $1fffffff;
//Version Constants
GRFINGER_FULL =                                      1;
GRFINGER_LIGHT =                                     2;
//Template format constants
GR_FORMAT_DEFAULT =                                  0;
GR_FORMAT_GR001 =                                    1;
GR_FORMAT_GR002 =                                    2;
GR_FORMAT_GR003 =                                    3;
GR_FORMAT_CLASSIC =                                100;
GR_FORMAT_ISO =                                    200;
GR_FORMAT_ANSI =                                   201;


//*****************************************************
//TYPE DEFINITIONS
//*****************************************************
type
// Event types
GRCAP_STATUS_EVENTS = Integer;
GRCAP_FINGER_EVENTS = Integer;
// Image format
GRCAP_IMAGE_FORMAT = Integer;
LPHBitmap = ^HBITMAP;
LPHDC     = ^LongInt;

//*****************************************************
//CALLBACK TYPES
//*****************************************************
GRCAP_STATUS_EVENT_PROC = Procedure(idSensor: Pchar; event: GRCAP_STATUS_EVENTS); stdcall;
GRCAP_FINGER_EVENT_PROC = Procedure(idSensor: Pchar; event: GRCAP_FINGER_EVENTS); stdcall;
GRCAP_IMAGE_EVENT_PROC = Procedure(idSensor: PChar; width: Integer; height: Integer; rawImage: PChar; res: Integer); stdcall;

//*****************************************************
// Functions - CAPTURE
//*****************************************************
var GrCapInitialize: function(StatusEventHandler: GRCAP_STATUS_EVENT_PROC): Integer; stdcall;

var GrCapFinalize: function: Integer; stdcall;

var GrCapStartCapture: function(idSensor: PChar; FingerEventHandler: GRCAP_FINGER_EVENT_PROC; ImageEventHandler: GRCAP_IMAGE_EVENT_PROC): Integer; stdcall;

var GrCapStopCapture: function(idSensor: PChar): Integer; stdcall;

var GrCapRawImageToHandle: function(rawImage: PChar; width, height: Integer; hdc: HDC; var handle: HBITMAP): Integer; stdcall;

var GrCapSaveRawImageToFile: function(rawImage: PChar; width, height: Integer; filename: String; imageFormat: GRCAP_IMAGE_FORMAT): Integer; stdcall;

var GrCapLoadImageFromFile: function(filename: String; res: Integer): Integer; stdcall;

var GrBiometricDisplay: function(templateQuery,rawImage: PChar; width, height,res: Integer; hdc: HDC; var handle: HBITMAP; context: Integer): Integer; stdcall;

var GrBiometricDisplayRaw: function(templateQuery,rawImage: PChar; width, height,res: Integer; outputImageRGB: PChar; context: Integer): Integer; stdcall;

//*****************************************************
// Functions - EXTRACT
//*****************************************************
var GrExtract: function(rawimage: Pchar; width: Integer; height: Integer; res: Integer; tpt: PChar; var tptSize: Integer; context: Integer): Integer; stdcall;

var GrExtractEx: function(rawimage: Pchar; width: Integer; height: Integer; res: Integer; tpt: PChar; var tptSize: Integer; context: Integer; tptFormat: Integer): Integer; stdcall;

//*****************************************************
// Functions - TEMPLATE CONVERSION
//*****************************************************

var GrConvertTemplate: function(oldTpt: Pchar; newTpt: Pchar; newTptSize: Integer; context: Integer; format: Integer): Integer; stdcall;

//*****************************************************
// Functions - CONSOLIDATION
//*****************************************************
var GrStartEnroll: function(context: Integer): Integer; stdcall;

var GrEnroll: function(rawimage: Pchar; width: Integer; height: Integer; res: Integer; tpt: PChar; var tptSize: Integer; var quality: Integer; tptFormat: Integer; context: Integer): Integer; stdcall;

//*****************************************************
// Functions - BASE64
//*****************************************************
var GrEncodeBase64: function(buffer: Pchar; bufferSize:Integer; encodedBuffer: Pchar; var encodedSize: Integer): Integer; stdcall;

var GrDecodeBase64: function(encodedBuffer: Pchar; encodedSize:Integer; decodedBuffer: Pchar; var decodedSize: Integer): Integer; stdcall;

var GrIsBase64Encoding: function(buffer: Pchar; bufferSize:Integer): Boolean; stdcall;

//*****************************************************
// Functions - MATCH
//*****************************************************
var GrInitialize: function: Integer; stdcall;

var GrFinalize: function: Integer; stdcall;

var GrCreateContext: function(var contextId: Integer): Integer; stdcall;

var GrDestroyContext: function(contextId: Integer): Integer; stdcall;

var GrVerify: function(queryTemplate: PChar; referenceTemplate: PChar; var verifyScore: Integer; context: Integer): Integer; stdcall;

var GrIdentifyPrepare: function(templateQuery: PChar; context: Integer): Integer; stdcall;

var GrIdentify: function(templateReference: PChar; var identifyScore: Integer; context: Integer): Integer; stdcall;

//*****************************************************
// Functions - CONFIG
//*****************************************************
var GrSetLicenseFolder: function(licenseFolder: String): Integer; stdcall;

var GrSetIdentifyParameters: function(identifyThreshold: Integer; identifyRotationTolerance: Integer; context: Integer): Integer; stdcall;

var GrSetVerifyParameters: function(verifyThreshold: Integer; verifyRotationTolerance: Integer; context: Integer): Integer; stdcall;

var GrGetIdentifyParameters: function(var identifyThreshold: Integer; var identifyRotationTolerance: Integer; context: Integer): Integer; stdcall;

var GrGetVerifyParameters: function(var verifyThreshold: Integer; var verifyRotationTolerance: Integer; context: Integer): Integer; stdcall;

var GrSetBiometricDisplayColors: function(minutiaeColor, minutiaeMatchedColor: Integer; segmentColor, segmentMatchedColor: Integer; directionColor, directionMatchedColor: Integer): Integer; stdcall;

var GrGetGrFingerVersion: function(var majorVersion: Byte; var minorVersion: Byte): Integer; stdcall;

var GrInstallLicense: function(productKey: String): Integer; stdcall;


type
  GenericProc = procedure;

procedure LoadGrFingerLib;
  
implementation
//*****************************************************
// EXTERNAL DECLARATIONS
//*****************************************************

var
  SaveExit: pointer;
  DLLHandle: THandle=0;
  ErrorMode: Integer;

procedure Load(var P; Name: String);
var GP : GenericProc absolute P;
begin
  @GP := GetProcAddress(DllHandle, PChar(Name));
end;

procedure LoadGrFingerLib;
begin
  if DllHandle<>0 then Exit;
  ErrorMode := SetErrorMode($8000{SEM_NoOpenFileErrorBox});
  DllHandle := LoadLibrary(PChar('GrFinger.dll'));
  if DllHandle>=32 then begin
    Load(GrCapInitialize, '_GrCapInitialize@4');
    Load(GrCapFinalize, '_GrCapFinalize@0');
    Load(GrCapStartCapture, '_GrCapStartCapture@12');
    Load(GrCapStopCapture, '_GrCapStopCapture@4');
    Load(GrCapRawImageToHandle, '_GrCapRawImageToHandle@20');
    Load(GrCapSaveRawImageToFile, '_GrCapSaveRawImageToFile@20');
    Load(GrCapLoadImageFromFile, '_GrCapLoadImageFromFile@8');
    Load(GrExtract, '_GrExtract@28');
    Load(GrExtractEx, '_GrExtractEx@32');
    Load(GrConvertTemplate, '_GrConvertTemplate@20');
    Load(GrStartEnroll, '_GrStartEnroll@4');
    Load(GrEnroll, '_GrEnroll@36');
    Load(GrInitialize, '_GrInitialize@0');
    Load(GrFinalize, '_GrFinalize@0');
    Load(GrCreateContext, '_GrCreateContext@4');
    Load(GrDestroyContext, '_GrDestroyContext@4');
    Load(GrVerify, '_GrVerify@16');
    Load(GrIdentifyPrepare, '_GrIdentifyPrepare@8');
    Load(GrIdentify, '_GrIdentify@12');
    Load(GrSetLicenseFolder, '_GrSetLicenseFolder@4');
    Load(GrSetIdentifyParameters, '_GrSetIdentifyParameters@12');
    Load(GrSetVerifyParameters, '_GrSetVerifyParameters@12');
    Load(GrGetIdentifyParameters, '_GrGetIdentifyParameters@12');
    Load(GrGetVerifyParameters, '_GrGetVerifyParameters@12');
    Load(GrBiometricDisplay, '_GrBiometricDisplay@32');
    Load(GrBiometricDisplayRaw, '_GrBiometricDisplayRaw@28');
    Load(GrSetBiometricDisplayColors, '_GrSetBiometricDisplayColors@24');
    Load(GrGetGrFingerVersion, '_GrGetGrFingerVersion@8');
    Load(GrInstallLicense, '_GrInstallLicense@4');
    Load(GrEncodeBase64, '_GrEncodeBase64@16');
    Load(GrDecodeBase64, '_GrDecodeBase64@16');
    Load(GrIsBase64Encoding, '_GrIsBase64Encoding@8');
  end else begin
  end;
  SetErrorMode(ErrorMode);
end;

initialization
  DllHandle := 0;

finalization
  if DllHandle>=32 then
    FreeLibrary(DllHandle); 
										
end.
