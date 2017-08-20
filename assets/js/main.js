import Elm from './elm';

const elmDiv = document.querySelector('#elm_target');

if (elmDiv) {
  const socketUrl = document.querySelector('meta[name="socket_url"]').getAttribute('content');
  const guardianToken = document.querySelector('meta[name="guardian_token"]').getAttribute('content');

  Elm.Main.embed(elmDiv, { socketUrl, guardianToken });
}