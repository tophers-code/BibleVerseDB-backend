# db/verse_seeds.rb
# Loaded by db/seeds.rb after bible_books and categories are seeded.
# Add new verse batches here grouped by book as your study grows,
# then add a seed_verses.call("BookName", array) line at the bottom.
#
# ============================================================
# FUTURE FEATURE NOTES
# ============================================================
# - Progressions: Rom 2:5 is step 5 in the salvation message progression.
#   No seed structure exists yet for Progressions.
# - Phrase-level highlighting: Several entries have specific phrases marked
#   (e.g. "repentance", "storing up wrath", "day of wrath", "as it is written").
#   A future `highlight_text` field on VerseCategory would allow storing
#   the exact phrase alongside the category note.
# ============================================================

puts "Seeding additional verses..."

# ------------------------------------------------------------
# GENESIS
# ------------------------------------------------------------

genesis_verses_additions = [
  {
    chapter: 19, verse_start: 4, verse_end: 8,
    notes: "The men of Sodom demand Lot's visitors; Lot pleads with them not to act wickedly",
    categories: [
      { name: "Hamartiology", notes: "The men of Sodom exemplify collective, unrestrained sin" },
      { name: "Ponerology", notes: "The nature of evil on display in the wickedness of Sodom" }
    ]
  },
]

# ------------------------------------------------------------
# EXODUS
# ------------------------------------------------------------

exodus_verses = [
  {
    chapter: 3, verse_start: 14, verse_end: nil,
    notes: '"I AM WHO I AM" — God reveals his divine name and self-existence to Moses',
    categories: [
      { name: "Theology", notes: "God's self-revelation as the self-existent, eternal I AM" }
    ]
  },
  {
    chapter: 20, verse_start: 5, verse_end: nil,
    notes: 'Highlighted word: "jealous" — God explicitly identifies himself as a jealous God',
    categories: [
      { name: "Theology", notes: "God's attribute of jealousy — he will not share his glory or worship with another" }
    ]
  },
  {
    chapter: 29, verse_start: 36, verse_end: 37,
    notes: '"Atonement" appears three times — sin offering for atonement, make atonement for the altar',
    categories: [
      { name: "Soteriology", notes: "God's prescribed ritual atonement for sin through sacrifice" }
    ]
  },
  {
    chapter: 30, verse_start: 10, verse_end: nil,
    notes: '"Atonement" appears twice — blood of the sin offering of atonement, made once per year',
    categories: [
      { name: "Soteriology", notes: "Annual atonement on the altar foreshadowing the once-for-all atonement of Christ" }
    ]
  },
  {
    chapter: 30, verse_start: 15, verse_end: 16,
    notes: '"Atonement" appears three times — atonement money given to make atonement for your lives',
    categories: [
      { name: "Soteriology", notes: "Ransom/atonement payment as a covering for sin before God" }
    ]
  },
  {
    chapter: 34, verse_start: 6, verse_end: 7,
    notes: "God proclaims his own attributes to Moses — the foundational self-description of God's character",
    categories: [
      { name: "Theology", notes: "God's attributes: merciful, gracious, slow to anger, abounding in steadfast love and faithfulness, forgiving" }
    ]
  },
  {
    chapter: 34, verse_start: 35, verse_end: nil,
    notes: "Moses' face shines from being in God's presence — reflects the glory of God",
    categories: [
      { name: "Theology", notes: "The glory of God physically manifested on Moses after speaking with the LORD" }
    ]
  },
]

# ------------------------------------------------------------
# LEVITICUS
# ------------------------------------------------------------

leviticus_verses = [
  {
    chapter: 11, verse_start: 44, verse_end: 45,
    notes: '"Be holy, for I am holy" — God grounds the call to consecration in his own holy nature',
    categories: [
      { name: "Theology", notes: "God's holiness as his defining attribute — the basis for all moral commands" },
      { name: "Hagiasmology", notes: "The call to consecration and sanctification flows directly from the holiness of God himself" }
    ]
  },
]

# ------------------------------------------------------------
# NUMBERS
# ------------------------------------------------------------

numbers_verses = [
  {
    chapter: 23, verse_start: 19, verse_end: nil,
    notes: 'Yellow highlight on "he should lie", "he should change his mind", and "will he not fulfill it?" — God\'s immutability and absolute truthfulness declared through Balaam\'s oracle',
    categories: [
      { name: "Theology", notes: "God is not a man — he does not lie, does not change his mind, and always fulfills what he has spoken" }
    ]
  },
]

# ------------------------------------------------------------
# DEUTERONOMY
# ------------------------------------------------------------

deuteronomy_verses = [
  {
    chapter: 6, verse_start: 4, verse_end: 5,
    notes: 'The Shema — "The LORD our God, the LORD is one" and the greatest commandment to love God with all heart, soul, and might',
    categories: [
      { name: "Theology", notes: "The foundational declaration of God's oneness (monotheism) and the corresponding call to total devotion" }
    ]
  },
  {
    chapter: 6, verse_start: 5, verse_end: 9,
    notes: 'No highlight yet (to be added). Daily embodied practices of devotion — loving God wholly and keeping his words ever-present in life, home, and family',
    categories: [
      { name: "Hagiasmology", notes: "Sanctification lived out daily — God's word on the heart, taught to children, spoken constantly, bound on the body, written on the home" }
    ]
  },
  {
    chapter: 10, verse_start: 14, verse_end: nil,
    notes: 'Yellow highlight on "the heaven of heavens, the earth with all that is in it" — God\'s total ownership of all creation',
    categories: [
      { name: "Theology", notes: "God's absolute sovereignty and ownership over all creation — heaven, earth, and everything in it belongs to him" }
    ]
  },
  {
    chapter: 18, verse_start: 18, verse_end: 19,
    notes: 'Teal underline — God promises a prophet like Moses through whom his words will be spoken; whoever does not listen will be held accountable',
    categories: [
      { name: "Bibliology", notes: "God's words placed directly in the prophet's mouth — establishes the divine origin and authority of prophetic Scripture" }
    ]
  },
  {
    chapter: 21, verse_start: 8, verse_end: nil,
    notes: 'Red box around "atonement" and "redeemed" — the prayer pairs atonement and redemption together in a single plea to the LORD',
    categories: [
      { name: "Soteriology", notes: "Atonement and redemption linked — God both covers guilt and redeems his people; an early pairing of two key salvation concepts" }
    ]
  },
]

# ------------------------------------------------------------
# JOSHUA
# ------------------------------------------------------------

joshua_verses = [
  {
    chapter: 24, verse_start: 14, verse_end: nil,
    notes: 'Light-red underline on "fear the LORD and serve him in sincerity and in faithfulness"',
    categories: [
      { name: "Hagiasmology", notes: "The call to wholehearted, sincere, and faithful service to God as the mark of a sanctified life" }
    ]
  },
  {
    chapter: 24, verse_start: 15, verse_end: nil,
    notes: 'Light-red underline on "choose this day whom you will serve...but as for me and my house, we will serve the LORD"',
    categories: [
      { name: "Hagiasmology", notes: "Sanctification requires a decisive, daily choice — Joshua's household commitment to serve the LORD as a model of whole-life devotion" }
    ]
  },
]

# ------------------------------------------------------------
# MATTHEW
# ------------------------------------------------------------

matthew_verses = [
  {
    chapter: 22, verse_start: 44, verse_end: nil,
    notes: 'NT citation — Jesus quotes Psalm 110:1 to establish his divine identity: "The Lord said to my Lord, Sit at my right hand, until I put your enemies under your feet"',
    categories: [
      { name: "Christology", notes: "Jesus cites Psalm 110:1 to reveal his pre-existence and divine lordship — if David calls him Lord, how can he merely be David's son?" },
      { name: "Bibliology", notes: "Jesus' use of Psalm 110:1 demonstrates OT-NT continuity — the earlier scripture is fulfilled and clarified in Christ" }
    ]
  },
]

# ------------------------------------------------------------
# PSALMS
# ------------------------------------------------------------

psalms_verses = [
  {
    chapter: 12, verse_start: 6, verse_end: nil,
    notes: 'Teal highlight on full verse; yellow highlight on "pure words, like silver refined" — the words of the LORD are absolutely pure, refined like silver seven times over',
    categories: [
      { name: "Bibliology", notes: "God's words are perfectly pure and trustworthy — refined beyond any impurity, the standard of truth" },
      { name: "Theology", notes: "God's purity reflected in his word — \"pure words, like silver refined\" reveals his own unblemished character" }
    ]
  },
  {
    chapter: 16, verse_start: 8, verse_end: nil,
    notes: 'Yellow highlight on "because he is at my right hand, I shall not be shaken" — David\'s unshakeable confidence rooted in God\'s constant presence',
    categories: [
      { name: "Theology", notes: "God's constant presence as the source of stability and confidence — he is at the right hand, therefore nothing can shake" }
    ]
  },
  {
    chapter: 19, verse_start: 1, verse_end: 2,
    notes: 'Yellow highlight — "The heavens declare the glory of God, and the sky above proclaims his handiwork. Day to day pours out speech, and night to night reveals knowledge."',
    categories: [
      { name: "Theology", notes: "Creation as continuous, universal declaration of God's glory — the heavens and sky testify to his handiwork day and night" }
    ]
  },
  {
    chapter: 19, verse_start: 7, verse_end: 11,
    notes: 'Teal highlight — the law of the LORD is perfect, sure, right, pure, clean, true, and righteous; reviving the soul, making wise, rejoicing the heart, enlightening the eyes; more desirable than gold, sweeter than honey; great reward in keeping them',
    categories: [
      { name: "Bibliology", notes: "The perfection and sufficiency of God's word — each attribute of the law (perfect, sure, right, pure, clean, true) paired with its benefit to the one who keeps it" }
    ]
  },
  {
    chapter: 24, verse_start: 8, verse_end: nil,
    notes: 'Yellow highlight — "The LORD, strong and mighty, the LORD, mighty in battle!" — God declared as the all-powerful warrior King',
    categories: [
      { name: "Theology", notes: "God's omnipotence on display — he is strong, mighty, and mighty in battle; no force can stand against him" }
    ]
  },
  {
    chapter: 27, verse_start: 4, verse_end: nil,
    notes: 'Yellow highlight on "the beauty of the LORD" — David\'s singular desire to dwell in God\'s house and gaze upon his beauty',
    categories: [
      { name: "Theology", notes: "God's beauty as an attribute — David's one desire is to behold it; points to the transcendent loveliness of God's own nature and presence" }
    ]
  },
  {
    chapter: 33, verse_start: 13, verse_end: 14,
    notes: 'Yellow highlight — "The LORD looks down from heaven; he sees all the children of man; from where he sits enthroned he looks out on all the inhabitants of the earth"',
    categories: [
      { name: "Theology", notes: "God's omniscience and sovereign oversight — enthroned in heaven, he sees and observes all humanity without exception" }
    ]
  },
  {
    chapter: 51, verse_start: 5, verse_end: nil,
    notes: 'Blue underline — "I was brought forth in iniquity, and in sin did my mother conceive me" — original sin declared; humanity is sinful from conception',
    categories: [
      { name: "Theological Anthropology", notes: "Humanity's sinful nature is not acquired but innate — conceived and brought forth in iniquity; the doctrine of original sin" },
      { name: "Hamartiology", notes: "Sin is not merely behavioral but ontological — present from conception, embedded in human nature from the start" }
    ]
  },
  {
    chapter: 53, verse_start: 3, verse_end: nil,
    notes: 'Red underline — "there is none who does good, not even one" — universal human depravity; cited by Paul in Romans 3:10-12',
    categories: [
      { name: "Hamartiology", notes: "Universal depravity — not one person does good; the total corruption of human nature apart from God" }
    ]
  },
  {
    chapter: 90, verse_start: 2, verse_end: nil,
    notes: 'Yellow highlight on "from everlasting to everlasting you are God" — Moses declares God\'s eternal, self-existent nature outside of time',
    categories: [
      { name: "Theology", notes: "God's eternality — he exists from everlasting to everlasting, uncreated and unbound by time" }
    ]
  },
  {
    chapter: 90, verse_start: 4, verse_end: nil,
    notes: 'Yellow highlight on "a thousand years in your sight are but as yesterday when it is past, or as a watch in the night" — God\'s transcendence over time',
    categories: [
      { name: "Theology", notes: "God's relationship to time — a thousand years is as a day to him; he is utterly unbound by temporal limitations" }
    ]
  },
  {
    chapter: 102, verse_start: 26, verse_end: 27,
    notes: 'Yellow highlight on "but you are the same, and your years have no end" — creation perishes but God remains unchanged and eternal',
    categories: [
      { name: "Theology", notes: "God's immutability and eternality — all creation wears out like a garment, but he is the same and his years have no end" }
    ]
  },
  {
    chapter: 103, verse_start: 8, verse_end: nil,
    notes: 'Yellow highlight — "The LORD is merciful and gracious, slow to anger and abounding in steadfast love" — David echoes God\'s own self-description from Exodus 34:6-7',
    categories: [
      { name: "Theology", notes: "God's character attributes declared in worship — merciful, gracious, slow to anger, abounding in steadfast love; an echo of Exodus 34:6-7" }
    ]
  },
  {
    chapter: 103, verse_start: 11, verse_end: nil,
    notes: 'Red underline — "as high as the heavens are above the earth, so great is his steadfast love toward those who fear him"',
    categories: [
      { name: "Theology", notes: "The immeasurable height of God's steadfast love — as vast as the heavens above the earth toward those who fear him" }
    ]
  },
  {
    chapter: 103, verse_start: 12, verse_end: nil,
    notes: 'Red underline — "as far as the east is from the west, so far does he remove our transgressions from us"',
    categories: [
      { name: "Soteriology", notes: "The complete removal of transgressions — as immeasurably far as east is from west; the totality of God's forgiveness" }
    ]
  },
  {
    chapter: 106, verse_start: 1, verse_end: nil,
    notes: 'Yellow highlight — "Oh give thanks to the LORD, for he is good, for his steadfast love endures forever! Who can utter the mighty deeds of the LORD"',
    categories: [
      { name: "Theology", notes: "God's goodness, steadfast love, and mighty deeds declared in worship — his love endures forever and his deeds are beyond telling" }
    ]
  },
  {
    chapter: 110, verse_start: 1, verse_end: nil,
    notes: 'Full verse — Theology + Christology: "The LORD says to my Lord" — the Father speaks to the Son; a Trinitarian window showing the distinction of persons',
    categories: [
      { name: "Theology", notes: "God the Father's sovereign declaration — the LORD speaks, establishing divine authority and the eternal relationship between Father and Son" },
      { name: "Christology", notes: "\"My Lord\" is the pre-incarnate Christ — the Father addresses the Son, pointing to Christ's divine identity and lordship" }
    ]
  },
  {
    chapter: 110, verse_start: 1, verse_end: nil,
    notes: 'Christology only — "Sit at my right hand" — the exaltation of Christ to the place of supreme honor at the Father\'s right hand',
    categories: [
      { name: "Christology", notes: "Christ's exaltation to the right hand of the Father — the position of supreme authority, honor, and intercession" }
    ]
  },
  {
    chapter: 115, verse_start: 3, verse_end: nil,
    notes: 'Yellow highlight on "he does all that he pleases" — God\'s absolute sovereign freedom; he is in the heavens and does whatever he wills',
    categories: [
      { name: "Theology", notes: "God's absolute sovereignty and freedom — enthroned in the heavens, he does all that he pleases without constraint or limitation" }
    ]
  },
  {
    chapter: 139, verse_start: 1, verse_end: nil,
    notes: 'Blue underline — "O LORD, you have searched me and known me!" — God\'s complete knowledge of each person',
    categories: [
      { name: "Theological Anthropology", notes: "Humanity is fully known by God — he searches and knows each person completely, leaving nothing hidden" },
      { name: "Theology", notes: "God's omniscience applied personally — he has searched and known the psalmist entirely" }
    ]
  },
  {
    chapter: 139, verse_start: 4, verse_end: nil,
    notes: 'Yellow highlight on "behold, O LORD, you know it altogether" — God knows every word before it is spoken',
    categories: [
      { name: "Theology", notes: "God's omniscience — he knows every word on the tongue before it is uttered; nothing escapes his knowledge" }
    ]
  },
  {
    chapter: 139, verse_start: 6, verse_end: nil,
    notes: 'Yellow highlight — "Such knowledge is too wonderful for me; it is high; I cannot attain it" — the incomprehensibility of God\'s omniscience',
    categories: [
      { name: "Theology", notes: "God's knowledge is beyond human comprehension — too wonderful, too high; points to his incomprehensible nature" }
    ]
  },
  {
    chapter: 139, verse_start: 7, verse_end: nil,
    notes: 'Orange highlight — "Where shall I go from your Spirit? Or where shall I flee from your presence?" — the omnipresence of the Holy Spirit',
    categories: [
      { name: "Pneumatology", notes: "The Holy Spirit's omnipresence — there is nowhere one can go to escape God's Spirit; he fills all of creation" }
    ]
  },
  {
    chapter: 139, verse_start: 10, verse_end: nil,
    notes: 'Yellow highlight — "even there your hand shall lead me, and your right hand shall hold me" — God\'s sustaining presence everywhere',
    categories: [
      { name: "Theology", notes: "God's guiding and sustaining hand reaches everywhere — even to the uttermost parts of the sea, he leads and holds his people" }
    ]
  },
  {
    chapter: 139, verse_start: 12, verse_end: nil,
    notes: 'Yellow highlight — "even the darkness is not dark to you; the night is bright as the day, for darkness is as light with you"',
    categories: [
      { name: "Theology", notes: "God's omniscience transcends darkness — no darkness can hide anything from him; light and dark are the same to his all-seeing eyes" }
    ]
  },
  {
    chapter: 139, verse_start: 13, verse_end: nil,
    notes: 'Blue underline on "you knitted me together in my mother\'s womb" — God as the deliberate creator of each individual person',
    categories: [
      { name: "Theology", notes: "God as the personal creator of each human being — he formed the inward parts and knitted each person together in the womb" },
      { name: "Theological Anthropology", notes: "Humanity is personally and deliberately formed by God — each person knit together in the womb by his hand" }
    ]
  },
  {
    chapter: 139, verse_start: 14, verse_end: nil,
    notes: 'Yellow highlight on "Wonderful are your works"; blue underline on "I am fearfully and wonderfully made"',
    categories: [
      { name: "Theology", notes: "God's works are wonderful — the creation of each human being reflects the awesome skill and care of the Creator" },
      { name: "Theological Anthropology", notes: "Humanity is fearfully and wonderfully made — each person bears the mark of God's extraordinary craftsmanship" }
    ]
  },
  {
    chapter: 139, verse_start: 16, verse_end: nil,
    notes: 'Blue underline — "in your book were written, every one of them, the days that were formed for me, when as yet there was none of them"',
    categories: [
      { name: "Theological Anthropology", notes: "Every day of a person's life was written in God's book before birth — humanity is known and planned by God before existence" }
    ]
  },
  {
    chapter: 139, verse_start: 17, verse_end: 18,
    notes: 'Yellow highlight — "How precious to me are your thoughts, O God! How vast is the sum of them! If I would count them, they are more than the sand"',
    categories: [
      { name: "Theology", notes: "God's thoughts are precious and innumerable — more than the sand; his mind is vast beyond all human comprehension" }
    ]
  },
  {
    chapter: 139, verse_start: 23, verse_end: 24,
    notes: 'Blue underline — "Search me, O God, and know my heart! Try me and know my thoughts! And see if there be any grievous way in me, and lead me in the way everlasting"',
    categories: [
      { name: "Theology", notes: "God's omniscience invited — the psalmist asks God to search and know his heart completely, trusting his all-seeing judgment" },
      { name: "Theological Anthropology", notes: "The human heart is searchable by God — he knows thoughts and discerns grievous ways hidden even from ourselves" },
      { name: "Hamartiology", notes: "The presence of grievous ways within — sin may lurk unseen in the heart, requiring God's searching light to expose and correct it" }
    ]
  },
  {
    chapter: 148, verse_start: 2, verse_end: nil,
    notes: 'Pink underline — "Praise him, all his angels; praise him, all his hosts!" — the angelic hosts called to worship',
    categories: [
      { name: "Angelology", notes: "The angelic hosts as worshippers — all angels and heavenly hosts called to praise the LORD" }
    ]
  },
  {
    chapter: 148, verse_start: 5, verse_end: nil,
    notes: 'Pink/red underline on "they were created" — the angels and heavenly hosts are created beings, brought into existence by God\'s command',
    categories: [
      { name: "Theology", notes: "God as creator by sovereign command — he spoke and the angels and heavenly hosts came into existence" },
      { name: "Angelology", notes: "Angels are created beings — they are not eternal or self-existent but brought forth by God's decree" }
    ]
  },
]

# ------------------------------------------------------------
# JOB
# ------------------------------------------------------------

job_verses = [
  {
    chapter: 1, verse_start: 6, verse_end: nil,
    notes: 'Red underline — Satan appears among the sons of God before the LORD. Footnote: "Hebrew the Accuser or the Adversary; so throughout chapters 1–2"',
    categories: [
      { name: "Demonology", notes: "Satan's access to God's presence as the Accuser/Adversary — his Hebrew name reveals his role" }
    ]
  },
  {
    chapter: 1, verse_start: 7, verse_end: nil,
    notes: 'Red underline — Satan describes himself as roaming the earth; reveals his active, restless presence throughout the world',
    categories: [
      { name: "Demonology", notes: "Satan as a roaming adversary — going to and fro on the earth, walking up and down on it" }
    ]
  },
  {
    chapter: 2, verse_start: 2, verse_end: nil,
    notes: 'Red underline — Satan again describes himself as roaming the earth; the repetition reinforces his persistent, active presence',
    categories: [
      { name: "Demonology", notes: "Satan's roaming nature repeated — a consistent pattern of active adversarial presence throughout the earth" }
    ]
  },
  {
    chapter: 26, verse_start: 13, verse_end: nil,
    notes: 'Red box around "the fleeing serpent" — God\'s hand pierced the fleeing serpent; connects to the serpent of Genesis 3 and the ultimate defeat of Satan',
    categories: [
      { name: "Demonology", notes: "Satan portrayed as the fleeing serpent — his defeat at the hand of God foreshadowed" },
      { name: "Eschatology", notes: "God's piercing of the fleeing serpent points forward to Satan's ultimate defeat and judgment" }
    ]
  },
  {
    chapter: 26, verse_start: 14, verse_end: nil,
    notes: 'Yellow highlight on "small a whisper do we hear of him" and "the thunder of his power" — what humanity perceives of God is merely the faintest outskirts of his ways',
    categories: [
      { name: "Pneumatology", notes: "The breath and spirit of God as the medium through which his power operates in creation" },
      { name: "Theology", notes: "God's incomprehensibility — the full thunder of his power is beyond human understanding; we only perceive a whisper" }
    ]
  },
  {
    chapter: 41, verse_start: 33, verse_end: 34,
    notes: 'Highlight should be pink-black (Demonology) — Leviathan described as without equal on earth, without fear, king over all the sons of pride; a creature of chaos and demonic character',
    categories: [
      { name: "Demonology", notes: "Leviathan as a symbol of chaos and evil — fearless, unmatched, king over pride; a creature with satanic/demonic overtones in biblical literature" }
    ]
  },
  {
    chapter: 42, verse_start: 2, verse_end: nil,
    notes: 'Yellow highlight — Job\'s confession: "I know that you can do all things, and that no purpose of yours can be thwarted"',
    categories: [
      { name: "Theology", notes: "God's omnipotence and sovereignty — no purpose of his can be thwarted by any creature or circumstance" }
    ]
  },
]

# ------------------------------------------------------------
# JUDGES
# ------------------------------------------------------------

judges_verses = [
  {
    chapter: 19, verse_start: 22, verse_end: 23,
    notes: 'Black underline — worthless men demand the visitor be brought out; the host pleads "do not act so wickedly...do not do this vile thing"',
    categories: [
      { name: "Ponerology", notes: "The nature of evil on full display — collective depravity mirroring the sin of Sodom in Genesis 19" },
      { name: "Hamartiology", notes: "Collective, unrestrained sin; the moral collapse of Israel echoing the wickedness of Sodom" }
    ]
  },
]

# ------------------------------------------------------------
# 2 SAMUEL
# ------------------------------------------------------------

samuel2_verses = [
  {
    chapter: 7, verse_start: 12, verse_end: 14,
    notes: 'Purple highlight — the Davidic Covenant: God promises an eternal offspring, an eternal kingdom, and a father-son relationship; ultimately fulfilled in Christ',
    categories: [
      { name: "Christology", notes: "The Davidic Covenant as messianic promise — the eternal offspring from David's body whose throne is established forever points to Christ" },
      { name: "Theology", notes: "God's covenant-keeping faithfulness — he binds himself by promise to David and fulfills it across generations" },
      { name: "Eschatology", notes: "The eternal throne and kingdom established forever — an eschatological promise reaching its fulfillment in the reign of Christ" }
    ]
  },
]

# ------------------------------------------------------------
# 1 KINGS
# ------------------------------------------------------------

kings1_verses = [
  {
    chapter: 8, verse_start: 23, verse_end: nil,
    notes: 'Yellow highlight — Solomon\'s declaration of God\'s incomparability: "there is no God like you, in heaven above or on earth beneath, keeping covenant and showing steadfast love"',
    categories: [
      { name: "Theology", notes: "God's absolute uniqueness and incomparability — no other god exists like him; he keeps covenant and shows steadfast love to those who walk before him" }
    ]
  },
]

# ------------------------------------------------------------
# 2 CHRONICLES
# ------------------------------------------------------------

chronicles2_verses = [
  {
    chapter: 7, verse_start: 14, verse_end: nil,
    notes: 'Yellow highlight — "if my people who are called by my name humble themselves, and pray and seek my face and turn from their wicked ways, then I will hear from heaven and will forgive their sin and heal their land"',
    categories: [
      { name: "Theology", notes: "God's conditional promise reveals his character — he hears prayer, forgives sin, and heals; responsive to humility and repentance" },
      { name: "Hagiasmology", notes: "Humbling, praying, seeking God's face, and turning from wickedness are sanctification lived out — the marks of a people growing in holiness" },
      { name: "Ecclesiology", notes: '"My people who are called by my name" — the covenant community, the Church, called to corporate repentance and renewal' }
    ]
  },
]

# ------------------------------------------------------------
# ACTS
# ------------------------------------------------------------

acts_verses = [
  {
    chapter: 3, verse_start: 22, verse_end: nil,
    notes: 'NT fulfillment of Deut 18:18-19 — Peter identifies Jesus as the prophet like Moses that God promised to raise up',
    categories: [
      { name: "Christology", notes: "Jesus as the fulfillment of the Mosaic prophetic promise — the prophet like Moses through whom God speaks definitively" }
    ]
  },
]

# ------------------------------------------------------------
# ROMANS
# ------------------------------------------------------------

romans_verses = [
  {
    chapter: 2, verse_start: 4, verse_end: nil,
    notes: 'Red underline; red box around "repentance" — God\'s kindness is meant to lead you to repentance',
    categories: [
      { name: "Soteriology", notes: "God's kindness and patience as the mechanism that draws people toward repentance" }
    ]
  },
  {
    chapter: 2, verse_start: 5, verse_end: nil,
    notes: 'Brown underline; red box around "storing up wrath"; "the day of wrath" highlighted — hard and impenitent heart storing up wrath for the day of judgment',
    categories: [
      { name: "Hamartiology", notes: "The hardened, impenitent heart actively accumulates divine wrath through unrepentant sin" },
      { name: "Eschatology", notes: "The day of wrath — God's righteous judgment will be revealed at the end" }
    ]
  },
  {
    chapter: 2, verse_start: 6, verse_end: nil,
    notes: 'Red underline — God will render to each one according to his works',
    categories: [
      { name: "Eschatology", notes: "Final judgment rendered according to works" }
    ]
  },
  {
    chapter: 2, verse_start: 7, verse_end: nil,
    notes: 'Red underline on "he will give eternal life" (v7b only)',
    categories: [
      { name: "Soteriology", notes: "Eternal life given to those who by patience in well-doing seek glory and honor and immortality" },
      { name: "Eschatology", notes: "Eternal life as the eschatological reward for perseverance in doing good" }
    ]
  },
  {
    chapter: 2, verse_start: 12, verse_end: nil,
    notes: 'Red underline — all who sinned without the law perish without the law; all who sinned under the law judged by the law',
    categories: [
      { name: "Hamartiology", notes: "Universal guilt before God — sin brings judgment whether under the law or not" }
    ]
  },
  {
    chapter: 2, verse_start: 14, verse_end: 15,
    notes: 'Collapsed entry: red underline on "are a law to themselves" (v14); red underline on "the law is written on their hearts" (v15a); blue underline on "their conscience also bears witness...accuse or even excuse them" (v15b)',
    categories: [
      { name: "Theological Anthropology", notes: "Natural law written on the human heart; conscience as an innate moral witness pointing to humanity's accountability before God" }
    ]
  },
  {
    chapter: 2, verse_start: 16, verse_end: nil,
    notes: 'Brown underline on "on that day when" — God judges the secrets of men by Christ Jesus',
    categories: [
      { name: "Eschatology", notes: "The day of judgment when God judges the hidden secrets of all people through Christ Jesus" }
    ]
  },
  {
    chapter: 3, verse_start: 10, verse_end: nil,
    notes: 'Light blue underline on "as it is written:" — citation introduction referencing OT scripture',
    categories: [
      { name: "Bibliology", notes: "Paul's use of OT scripture demonstrates cross-book corroboration — the Bible's books validate and reference one another as unified, authoritative teaching" }
    ]
  },
  {
    chapter: 3, verse_start: 19, verse_end: nil,
    notes: 'Black underline on "the whole world may be held accountable to God" (v19b only)',
    categories: [
      { name: "Hamartiology", notes: "Universal human accountability before God — no one is exempt from judgment" }
    ]
  },
  {
    chapter: 3, verse_start: 20, verse_end: nil,
    notes: 'Red underline — by works of the law no human being will be justified; through the law comes knowledge of sin',
    categories: [
      { name: "Hamartiology", notes: "The law's function is to reveal sin, not remove it" },
      { name: "Soteriology", notes: "Justification cannot come through works of the law — pointing to the need for another means of salvation" }
    ]
  },
  {
    chapter: 3, verse_start: 21, verse_end: 22,
    notes: 'Yellow underline on righteousness of God manifested apart from the law through faith in Jesus Christ, for all who believe',
    categories: [
      { name: "Theology", notes: "God's righteousness manifested apart from the law — a new revelation of his character through Christ" }
    ]
  },
  {
    chapter: 3, verse_start: 22, verse_end: nil,
    notes: 'Purple highlight on "faith in Jesus Christ"',
    categories: [
      { name: "Christology", notes: "Faith directed specifically toward Jesus Christ as the object of saving trust" },
      { name: "Soteriology", notes: "Faith in Jesus Christ as the instrument of justification for all who believe" }
    ]
  },
  {
    chapter: 3, verse_start: 22, verse_end: 25,
    notes: 'Red highlight — "all who believe...For there is no distinction...to be received by faith"',
    categories: [
      { name: "Soteriology", notes: "Universal availability of salvation by faith — no distinction between Jew and Greek; all have sinned and all may be justified" }
    ]
  },
  {
    chapter: 3, verse_start: 24, verse_end: 25,
    notes: 'Purple highlight on "through the redemption that is in Christ Jesus...by his blood"',
    categories: [
      { name: "Christology", notes: "Christ's redemptive work accomplished through his blood — the atoning death of Christ as the ground of justification" },
      { name: "Soteriology", notes: "Redemption and propitiation through Christ's blood received by faith" }
    ]
  },
  {
    chapter: 3, verse_start: 25, verse_end: 26,
    notes: 'Yellow highlight — "This was to show God\'s righteousness...the one who has faith in Jesus"',
    categories: [
      { name: "Soteriology", notes: "The atonement vindicates God's justice while justifying the one who has faith in Jesus" },
      { name: "Theology", notes: "God's righteousness demonstrated through the cross — he is both just and the justifier" }
    ]
  },
  {
    chapter: 3, verse_start: 30, verse_end: nil,
    notes: 'Yellow highlight on "God is one"',
    categories: [
      { name: "Theology", notes: "The oneness of God — monotheism as the foundation for the universal scope of justification by faith" }
    ]
  },
  {
    chapter: 4, verse_start: 2, verse_end: nil,
    notes: 'Red highlight — "was justified by works...counted to him as righteousness"',
    categories: [
      { name: "Soteriology", notes: "Righteousness counted/imputed — not earned by works but credited by God" }
    ]
  },
  {
    chapter: 4, verse_start: 5, verse_end: nil,
    notes: 'Red highlight — "believes in him who justifies the ungodly...faith is counted as righteousness"',
    categories: [
      { name: "Soteriology", notes: "God justifies the ungodly — faith counted as righteousness apart from works" }
    ]
  },
]

# ------------------------------------------------------------
# Insertion logic
# ------------------------------------------------------------

seed_verses = lambda do |book_name, verses|
  book = BibleBook.find_by!(name: book_name)
  verses.each do |verse_data|
    verse = Verse.find_or_create_by!(
      bible_book:  book,
      chapter:     verse_data[:chapter],
      verse_start: verse_data[:verse_start],
      verse_end:   verse_data[:verse_end]
    ) do |v|
      v.notes = verse_data[:notes]
    end

    verse_data[:categories].each do |cat_data|
      category = Category.find_by!(name: cat_data[:name])
      VerseCategory.find_or_create_by!(verse: verse, category: category) do |vc|
        vc.notes = cat_data[:notes]
      end
    end
  end
end

seed_verses.call("Genesis",      genesis_verses_additions)
seed_verses.call("Exodus",       exodus_verses)
seed_verses.call("Leviticus",    leviticus_verses)
seed_verses.call("Numbers",      numbers_verses)
seed_verses.call("Deuteronomy",  deuteronomy_verses)
seed_verses.call("Joshua",       joshua_verses)
seed_verses.call("Judges",       judges_verses)
seed_verses.call("Job",          job_verses)
seed_verses.call("Psalms",       psalms_verses)
seed_verses.call("1 Kings",      kings1_verses)
seed_verses.call("2 Samuel",     samuel2_verses)
seed_verses.call("2 Chronicles", chronicles2_verses)
seed_verses.call("Matthew",      matthew_verses)
seed_verses.call("Acts",         acts_verses)
seed_verses.call("Romans",       romans_verses)

puts "Additional verse seeding complete (#{Verse.count} total verses, #{VerseCategory.count} total category associations)"

# ------------------------------------------------------------
# Verse references (cross-book connections — run after all verses exist)
# ------------------------------------------------------------

verse_references = [
  {
    verse:            { book: "Deuteronomy", chapter: 18, verse_start: 18, verse_end: 19 },
    referenced_verse: { book: "Acts",        chapter: 3,  verse_start: 22, verse_end: nil }
  },
  {
    verse:            { book: "Genesis", chapter: 19, verse_start: 4, verse_end: 8 },
    referenced_verse: { book: "Judges",  chapter: 19, verse_start: 22, verse_end: 23 }
  },
  {
    verse:            { book: "Genesis", chapter: 3, verse_start: 1, verse_end: nil },
    referenced_verse: { book: "Job",     chapter: 26, verse_start: 13, verse_end: nil }
  },
  {
    verse:            { book: "Psalms", chapter: 53, verse_start: 3, verse_end: nil },
    referenced_verse: { book: "Romans", chapter: 3,  verse_start: 10, verse_end: nil }
  },
  {
    verse:            { book: "Psalms", chapter: 90, verse_start: 2, verse_end: nil },
    referenced_verse: { book: "Psalms", chapter: 90, verse_start: 4, verse_end: nil }
  },
  {
    verse:            { book: "Exodus", chapter: 34, verse_start: 6, verse_end: 7 },
    referenced_verse: { book: "Psalms", chapter: 103, verse_start: 8, verse_end: nil }
  },
  {
    verse:            { book: "Psalms", chapter: 103, verse_start: 11, verse_end: nil },
    referenced_verse: { book: "Psalms", chapter: 103, verse_start: 12, verse_end: nil }
  },
  {
    verse:            { book: "Psalms",  chapter: 110, verse_start: 1, verse_end: nil },
    referenced_verse: { book: "Matthew", chapter: 22,  verse_start: 44, verse_end: nil }
  },
]

verse_references.each do |ref|
  v_book = BibleBook.find_by!(name: ref[:verse][:book])
  r_book = BibleBook.find_by!(name: ref[:referenced_verse][:book])

  verse = Verse.find_by!(
    bible_book:  v_book,
    chapter:     ref[:verse][:chapter],
    verse_start: ref[:verse][:verse_start],
    verse_end:   ref[:verse][:verse_end]
  )

  referenced_verse = Verse.find_by!(
    bible_book:  r_book,
    chapter:     ref[:referenced_verse][:chapter],
    verse_start: ref[:referenced_verse][:verse_start],
    verse_end:   ref[:referenced_verse][:verse_end]
  )

  VerseReference.find_or_create_by!(
    verse:            verse,
    referenced_verse: referenced_verse
  )
end

puts "Verse references seeded (#{VerseReference.count} total)"

# ------------------------------------------------------------
# Tags & Verse Tags (run after all verses exist)
# ------------------------------------------------------------

# Seed tags
tags = [
  { name: "atonement",         description: "Passages referencing the covering or removal of sin through sacrifice or Christ's work" },
  { name: "consecration",      description: "Being set apart as holy unto the LORD" },
  { name: "conscience",        description: "The innate moral awareness written on the human heart" },
  { name: "covenant",          description: "A binding promise or agreement between God and his people" },
  { name: "creation",          description: "God's act of bringing the world into existence" },
  { name: "davidic covenant",  description: "God's promise to David of an eternal throne and offspring, fulfilled in Christ" },
  { name: "day of wrath",      description: "The specific eschatological event of God's final judgment and outpouring of wrath" },
  { name: "dominion",          description: "Humanity's God-given authority over creation" },
  { name: "end of days",       description: "General references to the last days, end times, or eschatological future" },
  { name: "eschatology",       description: "Passages addressing the final events of history — judgment, resurrection, the defeat of evil, and the coming of God's eternal kingdom" },
  { name: "eternal life",      description: "The gift of everlasting life granted to those who are justified by faith" },
  { name: "faith",             description: "Trust and belief directed toward God or Christ as the instrument of salvation" },
  { name: "faithfulness",      description: "God's unwavering reliability to his promises and covenant" },
  { name: "forgiveness",       description: "The remission of sin and guilt by God" },
  { name: "glory of god",      description: "The visible or manifest splendor and presence of God" },
  { name: "grace",             description: "God's unmerited favor toward sinners" },
  { name: "holiness",          description: "The state of being set apart and morally pure, as God is holy" },
  { name: "humility",          description: "The posture of lowering oneself before God or others" },
  { name: "i am",              description: "God's self-revelation of his eternal, self-existent name (YHWH)" },
  { name: "image of god",      description: "Humanity created in the likeness and image of God (imago Dei)" },
  { name: "immutability",      description: "God's unchanging nature — he does not lie or alter his purposes" },
  { name: "jealousy",          description: "God's righteous jealousy — he will not share his glory or worship with another" },
  { name: "judgment",          description: "God's act of rendering justice and accountability for sin" },
  { name: "justification",     description: "Being declared righteous before God, by faith apart from works" },
  { name: "mercy",             description: "God's compassionate withholding of deserved punishment" },
  { name: "messianic promise", description: "OT passages that point forward to the coming of Christ" },
  { name: "monotheism",        description: "The foundational truth that there is only one God" },
  { name: "natural law",       description: "The moral law written on human hearts by God, knowable apart from Scripture" },
  { name: "prayer",            description: "Communication directed toward God" },
  { name: "prophet",           description: "A spokesperson for God; passages referencing the prophetic office" },
  { name: "propitiation",      description: "The satisfaction of God's wrath through Christ's atoning sacrifice" },
  { name: "radiance",          description: "The shining of God's glory, often physically manifested" },
  { name: "redemption",        description: "Being bought back or delivered from bondage, sin, or death" },
  { name: "repentance",        description: "Turning away from sin and toward God" },
  { name: "righteousness",     description: "Moral uprightness; God's perfect standard; imputed to believers through faith" },
  { name: "sanctification",    description: "The ongoing process of being made holy" },
  { name: "seeking",           description: "Actively pursuing God in prayer, worship, or obedience" },
  { name: "shema",             description: "The foundational Jewish confession: 'The LORD our God, the LORD is one'" },
  { name: "sin",               description: "Transgression against God's law and character" },
  { name: "slow to anger",     description: "God's patient forbearance — he is not quick to judge or punish" },
  { name: "sodom",             description: "Passages referencing the wickedness of Sodom or its parallel patterns" },
  { name: "sovereignty",       description: "God's supreme authority and control over all creation and history" },
  { name: "steadfast love",    description: "God's hesed — his loyal, covenantal, unfailing love" },
  { name: "throne",            description: "References to God's throne or the establishment of a royal/eternal throne" },
  { name: "truthfulness",      description: "God's absolute honesty — he cannot lie or be deceived" },
  { name: "wickedness",        description: "Extreme moral evil and depravity" },
  { name: "wrath",             description: "God's righteous anger and opposition toward sin" },
  { name: "accuser",          description: "Satan's role as the one who brings charges against God's people before God" },
  { name: "adversary",        description: "Satan as the active opponent and enemy of God and humanity" },
  { name: "satan",            description: "References to Satan — the Accuser, Adversary, and enemy of God" },
  { name: "serpent",          description: "The serpent as a symbol of Satan — from Genesis 3 through Revelation" },
  { name: "incomprehensibility of god", description: "God's nature and power are beyond full human understanding — we perceive only the faintest outskirts" },
  { name: "spirit of god",    description: "References to the Spirit/breath of God at work in creation or revelation" },
  { name: "leviathan",        description: "The fearsome creature of chaos in Job — used symbolically of demonic/satanic power and pride" },
  { name: "omnipotence",      description: "God's all-encompassing power — nothing can thwart his purposes" },
  { name: "pride",            description: "The root sin of self-exaltation; associated with Satan and his domain" },
  { name: "purity",           description: "The absolute moral and spiritual purity of God and his word" },
  { name: "word of god",      description: "References to Scripture or God's spoken word as pure, authoritative, and trustworthy" },
  { name: "presence of god",  description: "The nearness and constant availability of God to his people" },
  { name: "beauty of god",    description: "The transcendent loveliness and splendor of God's own nature and presence" },
  { name: "omniscience",      description: "God's all-knowing nature — he sees and knows all things, including every person on earth" },
  { name: "original sin",     description: "The inherited sinful nature of humanity present from conception, traced to the Fall" },
  { name: "depravity",        description: "The total corruption of human nature — no one does good apart from God; universal sinfulness" },
  { name: "eternality",       description: "God's existence from everlasting to everlasting — unbound by time, without beginning or end" },
  { name: "goodness",         description: "God's inherent moral goodness and benevolence toward his creation" },
  { name: "trinity",          description: "Passages revealing or implying the triune nature of God — Father, Son, and Holy Spirit as distinct persons" },
  { name: "christology",      description: "Passages pointing to Christ's identity, nature, pre-existence, or work" },
  { name: "angels",           description: "References to angels — their nature, role, worship, and created status" },
  { name: "worship",          description: "The act of ascribing worth and praise to God, by humanity or angelic beings" },
]

puts "Seeding tags..."
tags.each do |tag_data|
  Tag.find_or_create_by!(name: tag_data[:name].downcase.strip) do |t|
    t.description = tag_data[:description]
  end
end
puts "Created #{Tag.count} tags"

# Verse tag associations
# Format: { book:, chapter:, verse_start:, verse_end:, tags: [] }
verse_tag_data = [
  # Matthew
  {
    book: "Matthew", chapter: 22, verse_start: 44, verse_end: nil,
    tags: ["christology", "trinity", "messianic promise", "throne"]
  },

  # Genesis
  {
    book: "Genesis", chapter: 1, verse_start: 1, verse_end: nil,
    tags: ["creation"]
  },
  {
    book: "Genesis", chapter: 1, verse_start: 25, verse_end: 27,
    tags: ["image of god"]
  },
  {
    book: "Genesis", chapter: 1, verse_start: 28, verse_end: 30,
    tags: ["dominion"]
  },
  {
    book: "Genesis", chapter: 19, verse_start: 4, verse_end: 8,
    tags: ["sin", "wickedness", "sodom"]
  },

  # Exodus
  {
    book: "Exodus", chapter: 3, verse_start: 14, verse_end: nil,
    tags: ["i am", "sovereignty"]
  },
  {
    book: "Exodus", chapter: 20, verse_start: 5, verse_end: nil,
    tags: ["jealousy"]
  },
  {
    book: "Exodus", chapter: 29, verse_start: 36, verse_end: 37,
    tags: ["atonement"]
  },
  {
    book: "Exodus", chapter: 30, verse_start: 10, verse_end: nil,
    tags: ["atonement"]
  },
  {
    book: "Exodus", chapter: 30, verse_start: 15, verse_end: 16,
    tags: ["atonement", "redemption"]
  },
  {
    book: "Exodus", chapter: 34, verse_start: 6, verse_end: 7,
    tags: ["mercy", "grace", "slow to anger", "faithfulness", "forgiveness", "steadfast love"]
  },
  {
    book: "Exodus", chapter: 34, verse_start: 35, verse_end: nil,
    tags: ["glory of god", "radiance"]
  },

  # Leviticus
  {
    book: "Leviticus", chapter: 11, verse_start: 44, verse_end: 45,
    tags: ["holiness", "consecration", "sanctification"]
  },

  # Numbers
  {
    book: "Numbers", chapter: 23, verse_start: 19, verse_end: nil,
    tags: ["immutability", "truthfulness", "sovereignty"]
  },

  # Deuteronomy
  {
    book: "Deuteronomy", chapter: 6, verse_start: 4, verse_end: 5,
    tags: ["shema", "monotheism"]
  },
  {
    book: "Deuteronomy", chapter: 6, verse_start: 5, verse_end: 9,
    tags: ["sanctification"]
  },
  {
    book: "Deuteronomy", chapter: 10, verse_start: 14, verse_end: nil,
    tags: ["sovereignty", "creation"]
  },
  {
    book: "Deuteronomy", chapter: 18, verse_start: 18, verse_end: 19,
    tags: ["prophet", "messianic promise", "covenant"]
  },
  {
    book: "Deuteronomy", chapter: 21, verse_start: 8, verse_end: nil,
    tags: ["atonement", "redemption"]
  },

  # Joshua
  {
    book: "Joshua", chapter: 24, verse_start: 14, verse_end: nil,
    tags: ["holiness", "sanctification"]
  },
  {
    book: "Joshua", chapter: 24, verse_start: 15, verse_end: nil,
    tags: ["sanctification"]
  },

  # Judges
  {
    book: "Judges", chapter: 19, verse_start: 22, verse_end: 23,
    tags: ["sin", "wickedness", "sodom"]
  },

  # Psalms
  {
    book: "Psalms", chapter: 12, verse_start: 6, verse_end: nil,
    tags: ["purity", "truthfulness", "word of god"]
  },
  {
    book: "Psalms", chapter: 16, verse_start: 8, verse_end: nil,
    tags: ["sovereignty", "presence of god"]
  },
  {
    book: "Psalms", chapter: 19, verse_start: 1, verse_end: 2,
    tags: ["glory of god", "creation", "sovereignty"]
  },
  {
    book: "Psalms", chapter: 19, verse_start: 7, verse_end: 11,
    tags: ["word of god", "purity", "truthfulness"]
  },
  {
    book: "Psalms", chapter: 24, verse_start: 8, verse_end: nil,
    tags: ["omnipotence", "sovereignty"]
  },
  {
    book: "Psalms", chapter: 27, verse_start: 4, verse_end: nil,
    tags: ["beauty of god", "presence of god"]
  },
  {
    book: "Psalms", chapter: 33, verse_start: 13, verse_end: 14,
    tags: ["omniscience", "sovereignty", "throne"]
  },
  {
    book: "Psalms", chapter: 51, verse_start: 5, verse_end: nil,
    tags: ["original sin", "sin", "image of god"]
  },
  {
    book: "Psalms", chapter: 53, verse_start: 3, verse_end: nil,
    tags: ["sin", "depravity"]
  },
  {
    book: "Psalms", chapter: 90, verse_start: 2, verse_end: nil,
    tags: ["eternality", "sovereignty", "i am"]
  },
  {
    book: "Psalms", chapter: 90, verse_start: 4, verse_end: nil,
    tags: ["eternality", "sovereignty"]
  },
  {
    book: "Psalms", chapter: 102, verse_start: 26, verse_end: 27,
    tags: ["eternality", "immutability", "sovereignty"]
  },
  {
    book: "Psalms", chapter: 103, verse_start: 8, verse_end: nil,
    tags: ["mercy", "grace", "slow to anger", "steadfast love", "faithfulness"]
  },
  {
    book: "Psalms", chapter: 103, verse_start: 11, verse_end: nil,
    tags: ["steadfast love", "sovereignty"]
  },
  {
    book: "Psalms", chapter: 103, verse_start: 12, verse_end: nil,
    tags: ["forgiveness", "redemption", "sin"]
  },
  {
    book: "Psalms", chapter: 106, verse_start: 1, verse_end: nil,
    tags: ["steadfast love", "goodness", "sovereignty"]
  },
  {
    book: "Psalms", chapter: 110, verse_start: 1, verse_end: nil,
    tags: ["messianic promise", "trinity", "throne", "christology"]
  },
  {
    book: "Psalms", chapter: 115, verse_start: 3, verse_end: nil,
    tags: ["sovereignty", "omnipotence"]
  },
  {
    book: "Psalms", chapter: 139, verse_start: 1, verse_end: nil,
    tags: ["omniscience", "presence of god", "image of god"]
  },
  {
    book: "Psalms", chapter: 139, verse_start: 4, verse_end: nil,
    tags: ["omniscience"]
  },
  {
    book: "Psalms", chapter: 139, verse_start: 6, verse_end: nil,
    tags: ["omniscience", "incomprehensibility of god"]
  },
  {
    book: "Psalms", chapter: 139, verse_start: 7, verse_end: nil,
    tags: ["spirit of god", "omniscience", "presence of god"]
  },
  {
    book: "Psalms", chapter: 139, verse_start: 10, verse_end: nil,
    tags: ["sovereignty", "presence of god"]
  },
  {
    book: "Psalms", chapter: 139, verse_start: 12, verse_end: nil,
    tags: ["omniscience", "sovereignty"]
  },
  {
    book: "Psalms", chapter: 139, verse_start: 13, verse_end: nil,
    tags: ["creation", "image of god", "sovereignty"]
  },
  {
    book: "Psalms", chapter: 139, verse_start: 14, verse_end: nil,
    tags: ["creation", "image of god"]
  },
  {
    book: "Psalms", chapter: 139, verse_start: 16, verse_end: nil,
    tags: ["sovereignty", "image of god"]
  },
  {
    book: "Psalms", chapter: 139, verse_start: 17, verse_end: 18,
    tags: ["omniscience", "incomprehensibility of god"]
  },
  {
    book: "Psalms", chapter: 139, verse_start: 23, verse_end: 24,
    tags: ["omniscience", "sin", "conscience", "holiness"]
  },
  {
    book: "Psalms", chapter: 148, verse_start: 2, verse_end: nil,
    tags: ["angels", "worship"]
  },
  {
    book: "Psalms", chapter: 148, verse_start: 5, verse_end: nil,
    tags: ["angels", "creation", "sovereignty"]
  },

  # Job
  {
    book: "Job", chapter: 1, verse_start: 6, verse_end: nil,
    tags: ["satan", "accuser", "adversary"]
  },
  {
    book: "Job", chapter: 1, verse_start: 7, verse_end: nil,
    tags: ["satan", "adversary"]
  },
  {
    book: "Job", chapter: 2, verse_start: 2, verse_end: nil,
    tags: ["satan", "adversary"]
  },
  {
    book: "Job", chapter: 26, verse_start: 13, verse_end: nil,
    tags: ["satan", "serpent", "eschatology"]
  },
  {
    book: "Job", chapter: 26, verse_start: 14, verse_end: nil,
    tags: ["incomprehensibility of god", "spirit of god", "sovereignty"]
  },
  {
    book: "Job", chapter: 41, verse_start: 33, verse_end: 34,
    tags: ["satan", "leviathan", "wickedness"]
  },
  {
    book: "Job", chapter: 42, verse_start: 2, verse_end: nil,
    tags: ["sovereignty", "omnipotence"]
  },
  {
    book: "Job", chapter: 41, verse_start: 33, verse_end: 34,
    tags: ["leviathan", "pride", "satan"]
  },
  {
    book: "Job", chapter: 42, verse_start: 2, verse_end: nil,
    tags: ["omnipotence", "sovereignty"]
  },

  # 2 Samuel
  {
    book: "2 Samuel", chapter: 7, verse_start: 12, verse_end: 14,
    tags: ["davidic covenant", "messianic promise", "covenant", "throne", "steadfast love"]
  },

  # 1 Kings
  {
    book: "1 Kings", chapter: 8, verse_start: 23, verse_end: nil,
    tags: ["covenant", "steadfast love", "faithfulness", "mercy", "monotheism", "prayer"]
  },

  # 2 Chronicles
  {
    book: "2 Chronicles", chapter: 7, verse_start: 14, verse_end: nil,
    tags: ["prayer", "humility", "seeking", "repentance", "forgiveness"]
  },

  # Acts
  {
    book: "Acts", chapter: 3, verse_start: 22, verse_end: nil,
    tags: ["prophet", "messianic promise"]
  },

  # Romans
  {
    book: "Romans", chapter: 2, verse_start: 4, verse_end: nil,
    tags: ["repentance", "mercy"]
  },
  {
    book: "Romans", chapter: 2, verse_start: 5, verse_end: nil,
    tags: ["wrath", "day of wrath", "judgment", "end of days"]
  },
  {
    book: "Romans", chapter: 2, verse_start: 6, verse_end: nil,
    tags: ["judgment"]
  },
  {
    book: "Romans", chapter: 2, verse_start: 7, verse_end: nil,
    tags: ["eternal life"]
  },
  {
    book: "Romans", chapter: 2, verse_start: 12, verse_end: nil,
    tags: ["sin", "judgment"]
  },
  {
    book: "Romans", chapter: 2, verse_start: 14, verse_end: 15,
    tags: ["natural law", "conscience"]
  },
  {
    book: "Romans", chapter: 2, verse_start: 16, verse_end: nil,
    tags: ["judgment", "end of days"]
  },
  {
    book: "Romans", chapter: 3, verse_start: 10, verse_end: nil,
    tags: ["sin"]
  },
  {
    book: "Romans", chapter: 3, verse_start: 19, verse_end: nil,
    tags: ["sin", "judgment"]
  },
  {
    book: "Romans", chapter: 3, verse_start: 20, verse_end: nil,
    tags: ["sin", "justification", "righteousness"]
  },
  {
    book: "Romans", chapter: 3, verse_start: 21, verse_end: 22,
    tags: ["righteousness", "faith"]
  },
  {
    book: "Romans", chapter: 3, verse_start: 22, verse_end: nil,
    tags: ["faith", "justification"]
  },
  {
    book: "Romans", chapter: 3, verse_start: 22, verse_end: 25,
    tags: ["faith", "justification", "righteousness"]
  },
  {
    book: "Romans", chapter: 3, verse_start: 24, verse_end: 25,
    tags: ["redemption", "propitiation", "atonement"]
  },
  {
    book: "Romans", chapter: 3, verse_start: 25, verse_end: 26,
    tags: ["righteousness", "justification", "atonement"]
  },
  {
    book: "Romans", chapter: 3, verse_start: 30, verse_end: nil,
    tags: ["monotheism", "justification", "faith"]
  },
  {
    book: "Romans", chapter: 4, verse_start: 2, verse_end: nil,
    tags: ["justification", "righteousness", "faith"]
  },
  {
    book: "Romans", chapter: 4, verse_start: 5, verse_end: nil,
    tags: ["justification", "righteousness", "faith"]
  },
]

puts "Seeding verse tags..."
verse_tag_data.each do |entry|
  book  = BibleBook.find_by!(name: entry[:book])
  verse = Verse.find_by!(
    bible_book:  book,
    chapter:     entry[:chapter],
    verse_start: entry[:verse_start],
    verse_end:   entry[:verse_end]
  )
  entry[:tags].each do |tag_name|
    tag = Tag.find_by!(name: tag_name.downcase.strip)
    VerseTag.find_or_create_by!(verse: verse, tag: tag)
  end
end
puts "Verse tags seeded (#{VerseTag.count} total)"