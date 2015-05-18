package GHULS::LoginGui;
use Wx;
use warnings;
use diagnostics;
use strict;
use base 'Wx::App';
use GHULS;

sub OnInit {
    my $self = shift;
    our $window = Wx::Window->new(undef, -1, 'GHULS', [-1, -1], [650, 675]);
    $window->Show(1);
    
    my $text_login = Wx::StaticText->new($window, -1, 'Login to GitHub', [325, 650], -1);
    my $usernamectrl = Wx::TextCtrl->new($window, -1, 'Username', [325, 625], wxDefaultSize, wxTE_SINGLELINE);
    my $passwordctrl = Wx::TextCtrl->new($window, -1, 'Password', [325, 600], wxDefaultSize, wxTE_PASSWORD);
    my $loginbutton = Wx::Button->new($window, -1, 'Login', [325, 575], [-1, -1]);
    
    Wx::Event->EVT_BUTTON($self, $loginbutton, get_login_data_file($usernamectrl, $passwordctrl);
    return 1;
}

sub get_login_data_file {
    my ($usernamectrl, $passwordctrl) = @_;
    my $username = $usernamectrl->GetValue();
    my $password = $passwordctrl->GetValue();
    
    open my $fh, '>', 'login.txt';
    print $fh "$username\n";
    print $fh "$password";
    close $fh;
    if (GHULS->login == 1) {
        error();
    } elsif (GHULS->login == 0) {
        $window->Close();
        my $analyzegui = GHULS::AnalyzeUsernameGui->new();
        $analyzegui->MainLoop();
    }
}