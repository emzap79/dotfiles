(function() {
    commands.addUserCommand(['readlater', 'rl'],
        'Send current page to Instapaper',
        function (args) {
            var d=content.document;
            var z=d.createElement('scr'+'ipt');
            var b=d.body;

            try {
                if(!b)
        throw(0);
    d.title='(Saving...) '+d.title;
    z.setAttribute('src','http://www.instapaper.com/j/4mUzrAlzv6nP');
    b.appendChild(z);
            }
            catch(e) {
                alert('Please wait until the page has loaded.');
            }
        }
        );
})();
