function tcs = testColorSample(type)
% type�Ƕ�ȡ�Ĳ���ɫ������ cri��cqs
persistent cri nist mcc
if strcmp(type,'cri')
    if isempty(cri)
        cri = readCRITCS();
    end
    tcs = cri;
elseif strcmp(type,'nist')
    if isempty(nist)
        nist = readCQSTCS();
    end
    tcs = nist;
elseif strcmp(type,'mcc')
    if isempty(mcc)
        mcc = readMCCTCS();
    end
    tcs = mcc;
else
    tcs = [];
end
end