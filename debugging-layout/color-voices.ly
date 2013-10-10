\version "2.16.2"

\header {
  snippet-title = "Color Voices"
  snippet-author = "Janek Warchoł, Urs Liska"
  snippet-description = \markup {
    This snippet redefines the commands
    "\voiceOne" to "\voiceFour" so that voices explicitly set
    with them are colored.
  }
  % add comma-separated tags to make searching more effective:
  tags = "color, preview, frescobaldi"
  % is this snippet ready?  See meta/status-values.md
  status = "unfinished" % aiming to be 'official'
  %{
    TODO:
    - also color implicit voices
     (because that may prove even important for debugging)
      Maybe it's not possible to do that
  %}
}

% Define appearance
#(cond ((not (defined? 'debug-explicit-voice-one-color))
        (define debug-explicit-voice-one-color darkred)))
#(cond ((not (defined? 'debug-explicit-voice-two-color))
        (define debug-explicit-voice-two-color darkblue)))
#(cond ((not (defined? 'debug-explicit-voice-three-color))
        (define debug-explicit-voice-three-color darkgreen)))
#(cond ((not (defined? 'debug-explicit-voice-four-color))
        (define debug-explicit-voice-four-color darkmagenta)))


%%%%%%%%%%%%%%%%%%%%%%%%%%
% here goes the snippet: %
%%%%%%%%%%%%%%%%%%%%%%%%%%

colorVoice = 
#(define-music-function (parser location color)
   (color?)
   #{
     \override NoteHead #'color = #color
     \override Stem #'color = #color
     \override Beam #'color = #color
     \override Accidental #'color = #color
   #})

voiceOne = {
  \voiceOne
  \colorVoice #debug-explicit-voice-one-color
}

voiceTwo = {
  \voiceTwo
  \colorVoice #debug-explicit-voice-two-color
}

voiceThree = {
  \voiceThree
  \colorVoice #debug-explicit-voice-three-color
}

voiceFour = {
  \voiceFour
  \colorVoice #debug-explicit-voice-four-color
}

oneVoice = {
  \oneVoice
  \revert NoteHead #'color
  \revert Stem #'color
  \revert Beam #'color
  \revert Accidental #'color
}
