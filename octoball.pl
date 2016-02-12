use Irssi;
use Irssi::Irc;
use vars qw($VERSION %IRSSI);

sub cmd_hl {
 my ($server, $data, $nick, $mask, $target) =@_;

 if ($data=~/^!octoball/)
 {
  Irssi::print ("Answering someone's question...");
   if ($server || $server->{connected})
   {

    @fortunes = (
      "It is certain",
      "It is decidedly so",
      "Without a doubt",
      "Yes definitely",
      "You may rely on it",
      "As I see it, yes",
      "Most likely",
      "Outlook good",
      "Yes",
      "Signs point to yes",
      "Reply hazy try again",
      "Ask again later",
      "Better not tell you now",
      "Cannot predict now",
      "Concentrate and ask again",
      "Don't count on it",
      "My reply is no",
      "My sources say no",
      "Outlook not so good",
      "Very doubtful"
    );

    $fortune = "\0036".$nick . ": \0034" . $fortunes[rand @fortunes];

    $server->command("/msg ".$target." " .$fortune);
    Irssi::print ("Sent someone an answer");

    } else {
     Irssi::print ("Not connected to server");
     $return = 1;
   }

 }
 return $return;
}

Irssi::signal_add_last('message public', 'cmd_hl');
Irssi::print("octoball script loaded");
