FLOW=$1

printf "syntax_error.js\n"
$FLOW check-contents --strip-root syntax_error.js < syntax_error.js

printf "syntax_error.js (no filename)\n"
$FLOW check-contents --strip-root < syntax_error.js

printf "\n\nnot_flow.js\n\n"
$FLOW check-contents --strip-root not_flow.js < not_flow.js

printf "\n\nnot_flow.js with --all\n\n"
$FLOW check-contents --strip-root --all not_flow.js < not_flow.js

printf "\n\nnot_flow.js with --respect-pragma\n\n"
$FLOW check-contents --strip-root --respect-pragma not_flow.js < not_flow.js

printf "\n\nnot_flow.js with --respect-pragma and --all\n\n"
$FLOW check-contents --strip-root --respect-pragma --all not_flow.js 2>&1 < not_flow.js

printf "\n\nunsaved_foo.js depends on bar.js which is still checked against foo.js\n\n"
$FLOW check-contents --strip-root foo.js 2>&1 < unsaved_foo.js
