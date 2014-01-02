requires 'perl', '5.008001';

requires 'File::ShareDir', '>= 1.00';
requires 'IPC::Run3',      '>= 0.046';

on 'test' => sub {
    requires 'Test::More',  '>= 0.99';
    requires 'Test::Warn';
    requires 'Test::Fatal';
    requires 'File::Which', '>= 1.09';
};
