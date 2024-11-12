clear all; clc;

% Make sure there is an EEGLAB (with neccessary plug-ins toolboxes) in the path.

% Put your project path here (project folder should have raw folder)
if ismac
    projDir = '/Users/joon/Documents/toolbox/ssPreprocessTool/NEWpreproc/example_data_and_codes_for_preprocessing'; % '/Volumes/ProjectExt/Jumping';
elseif ispc
    projDir = 'E:\ProjectExt\Gaeun\FaceCom_data';
end

% κ°? ?λ‘μ ?Έ? λͺ¨λ  ?λΈμ ?Έ raw ?°?΄?° ???₯ ?΄? ?΄λ¦μ? rawλ‘? λ°λ? λ§λ€ κ²?.
rawDir = fullfile(projDir, 'raw');

% ?λΈμ ?Έ ?΄λ¦μ? ?΄λ¦? ?΄??κ³? ? μ§λ‘ ? ?΄? ?΄λ¦μΌλ‘?.
% mff ??Ό ?΄λ¦λ eky_160727_1~6_xxxx.mff ??Όλ‘? ??΄?Ό ?¨.
subName = 'hsj_20221001'; % κ°? ?λΈμ ?Έ raw ?°?΄?° ???₯? ?΄? ?΄λ¦? λ°? mff ??Ό ?΄λ¦? ?? λΆ?λΆκ³Ό κ°μ?Ό ?¨.
% 2022λ‘? λ°κΎΈκΈ?.

% high-pass filtering of raw data to get rid of DC component
% if we want no fiter distortion, use Robust Detrend (NoiseTools) > 0.01 Hz
% filter using pop_basicfilter > 0.3 Hz
RobDetr = 'off'; % pop_basicfilter for highpass filtering > 0.3 Hz
% RobDetr = 'on'; % robust detrend using NoiseTools > 0.01 Hz

[EEG] = brx_openNpreprocess(rawDir, subName, RobDetr);
