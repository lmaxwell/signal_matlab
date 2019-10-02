M = 6; % Assume three formants and no noise

% compute Mth-order autocorrelation function:
rx = zeros(1,M+1)';
for i=1:M+1,
  rx(i) = rx(i) + speech(1:nsamps-i+1) ...
                * speech(1+i-1:nsamps)';
end

% prepare the M by M Toeplitz covariance matrix:
covmatrix = zeros(M,M);
for i=1:M,
  covmatrix(i,i:M) = rx(1:M-i+1)';
  covmatrix(i:M,i) = rx(1:M-i+1);
end

% solve "normal equations" for prediction coeffs:

Acoeffs = - covmatrix \ rx(2:M+1)

Alp = [1,Acoeffs']; % LP polynomial A(z)

nspec=512
dbenvlp = 20*log10(abs(freqz(1,Alp,nspec)'));
dbsspecn = dbsspec + ones(1,nspec)*(max(dbenvlp) ...
                   - max(dbsspec)); % normalize
plot(f,[max(dbsspecn,-100);dbenv;dbenvlp]); grid;

M = 6; % Assume three formants and no noise

% compute Mth-order autocorrelation function:
rx = zeros(1,M+1)';
for i=1:M+1,
  rx(i) = rx(i) + speech(1:nsamps-i+1) ...
                * speech(1+i-1:nsamps)';
end

% prepare the M by M Toeplitz covariance matrix:
covmatrix = zeros(M,M);
for i=1:M,
  covmatrix(i,i:M) = rx(1:M-i+1)';
  covmatrix(i:M,i) = rx(1:M-i+1);
end

% solve "normal equations" for prediction coeffs:

Acoeffs = - covmatrix \ rx(2:M+1)

Alp = [1,Acoeffs']; % LP polynomial A(z)

dbenvlp = 20*log10(abs(freqz(1,Alp,nspec)'));
dbsspecn = dbsspec + ones(1,nspec)*(max(dbenvlp) ...
                   - max(dbsspec)); % normalize
plot(f,[max(dbsspecn,-100);dbenv;dbenvlp]); grid;