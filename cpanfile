requires 'perl', '5.008001';

requires 'File::ShareDir', '>= 1.00';
requires 'IPC::Run3',      '>= 0.046';

on 'test' => sub {
    requires 'Test::More', '0.98';
    requires 'Test::Synopsis::Expectation', '0.02';
};
