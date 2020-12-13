{ ... }:
# recommend using `hashedPassword`
{
  users.users.root = {
    openssh.authorizedKeys.keyFiles = [
      ../louis/id_gpgcard.pub
    ];
  };
}
